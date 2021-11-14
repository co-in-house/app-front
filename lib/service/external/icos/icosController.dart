import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:mime/mime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:inhouse/util/util.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ICOSController {
  const ICOSController._(this._token);
  static ICOSController _instance;
  final _ICOSAccessToken _token;

  factory ICOSController() {
    if (_instance == null) {
      _instance = new ICOSController._(_ICOSAccessToken(null));
    }
    return _instance;
  }

  Future<String> uploadImage({
    @required int userId,
    @required int communityId,
    @required File f,
  }) async {
    String uploadedImagePath;
    final mimeType = lookupMimeType(f.path);
    if (!mimeType.startsWith('image/')) {
      debugPrint("you can't upload file: " + f.path);
      return uploadedImagePath;
    }

    if (_token.value == null || _token.value == "") {
      _token.value = await _ICOSService.getToken();
    }

    File targetAbsFile = await OsAccess.getAbsoluteFilePathFromAssets(f);

    int currentUnixTime = DateTime.now().millisecondsSinceEpoch;
    String extenstion = extension(f.path);
    String base64Name = base64
        .encode(utf8.encode(userId.toString() + currentUnixTime.toString()));
    try {
      uploadedImagePath = await _ICOSService.postFile(
        token: _token.value,
        dirName: communityId.toString(),
        fileName: base64Name + extenstion,
        file: targetAbsFile,
        contentType: mimeType,
      );
    } on ICOSException {
      _token.value = await _ICOSService.getToken();
      uploadedImagePath = await _ICOSService.postFile(
        token: _token.value,
        dirName: communityId.toString(),
        fileName: base64Name + extenstion,
        file: targetAbsFile,
        contentType: mimeType,
      );
    }
    return uploadedImagePath;
  }
}

class _ICOSAccessToken {
  _ICOSAccessToken(this.value);
  String value;
}

class _ICOSService {
  static Future<String> getToken() async {
    debugPrint("start ICOSService.getToken");
    String _token;
    final response = await http.post(
      Uri.https('iam.cloud.ibm.com', 'identity/token'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
      },
      body: {
        "grant_type": "urn:ibm:params:oauth:grant-type:apikey",
        "apikey": DotEnv().env[Const.iCOS_API_KEY],
      },
    );

    if (response.statusCode == 200) {
      _token = jsonDecode(response.body)['access_token'];
    } else {
      print("status : " + response.statusCode.toString());
      throw Exception('Failed to Get ICOS Access Token');
    }
    debugPrint("end ICOSService.getToken");
    return _token;
  }

  static Future<String> postFile({
    @required String token,
    @required String dirName,
    @required String fileName,
    @required File file,
    @required String contentType,
  }) async {
    Uint8List bytes = await file.readAsBytes();
    int _threshold = 1000000;
    debugPrint("row image  bytes: " + bytes.length.toString());
    if (bytes.length > _threshold) {
      // 1MBまで圧縮
      int quality = ((_threshold / bytes.length) * 100).toInt();
      debugPrint("compress image, quality:" + quality.toString());
      bytes = await FlutterImageCompress.compressWithFile(
        file.absolute.path,
        quality: quality,
      );
      debugPrint("compressed image bytes: " + bytes.length.toString());
    }

    String filePath;
    Uri uri = Uri.https(
        'inhouse-prod-image-01.s3.jp-tok.cloud-object-storage.appdomain.cloud',
        '$dirName/$fileName');
    final response = await http.put(
      uri,
      headers: <String, String>{
        'Content-Type': 'image/png',
        'Content-Length': bytes.length.toString(),
        'Authorization': 'Bearer $token',
      },
      body: bytes,
    );

    if (response.statusCode == 200) {
      filePath = uri.toString();
    } else if (response.statusCode == 403) {
      throw ICOSException("access token expired");
    } else {
      debugPrint("status : " + response.statusCode.toString());
      throw Exception('Failed to Upload file to ICOS ');
    }
    return filePath;
  }
}

class ICOSException implements Exception {
  final String msg;
  const ICOSException(this.msg);
  String toString() => 'ICOSException: $msg';
}
