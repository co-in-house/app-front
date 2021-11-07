import 'dart:convert';
import 'dart:io';
import 'package:inhouse/model/event/saveEventInfo.dart';
import 'package:inhouse/service/external/content/firebaseStorageController.dart';
import 'package:http/http.dart' as http;
import 'package:inhouse/util/util.dart';

// イベントの新規作成・更新
class SaveEventService {
  Future<void> post(SaveEventInfo saveEventInfo) async {
    // 画像のアップロード
    saveEventInfo.iconImgUrl =
        await FirebaseStorageController.uploadEventThumbnail(
      File(saveEventInfo.targetImgPath),
      saveEventInfo.communityId,
      saveEventInfo.title,
    );
    final String _body = jsonEncode(saveEventInfo);
    final response = await http.post(
      Uri.https(Const.APP_SERVIE_HOST, 'service/api/event/info'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: _body,
    );
    print("POST Event body : " + _body);

    // テスト用
    // await new Future.delayed(new Duration(seconds: 2));
    // final response = _MockResponse();

    print("<Request>");
    print("Request: " + response.request.toString());
    print("Header: " + response.request.headers.toString());
    print("Body: " + _body);
    print("<Response>");
    print("Status: " + response.statusCode.toString());
    if (response.statusCode == 200) {
      print("Body:" + response.body.toString());
      // stateの初期化
    } else {
      print("ReasonPrase:" + response.reasonPhrase);
      print("Header:" + response.headers.toString());
      // throw Exception('Failed to post NewCommunity Service');
    }
  }
}

class _MockResponse {
  int get statusCode => _statusCode;
  String get body => _body;

  int _statusCode = 200;
  String _body = '{}';
}
