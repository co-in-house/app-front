import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path/path.dart';

class FirebaseStorageController {
  // static final Reference ref = FirebaseStorage.instance.ref();
  static Future<String> uploadCommunityIcon(
      File file, String communityName) async {
    String extenstion = extension(file.path);
    String base64Name = base64.encode(utf8.encode(communityName));
    return await _upload(file, 'images/icon', base64Name + extenstion);
  }

  static Future<String> uploadEventThumbnail(
      File file, int communityId, String title) async {
    String extenstion = extension(file.path);
    String base64Id =
        base64.encode(utf8.encode(communityId.toString() + title));
    return await _upload(file, 'images/event', base64Id + extenstion);
  }

  //storageに保存
  static Future<String> _upload(
      File file, String dirName, String fileName) async {
    String downloadUrl = '';
    if (file.isAbsolute) {
      final TaskSnapshot storedImage = await FirebaseStorageAccess.ref
          .child(dirName + '/' + fileName)
          .putFile(File(file.absolute.path));
      print("put file to firebase");
      downloadUrl = await _loadImage(storedImage);
    }
    return downloadUrl;
  }

  //url取得
  static Future<String> _loadImage(TaskSnapshot storedImage) async {
    print('storageに保存しました');
    final String downloadUrl = await storedImage.ref.getDownloadURL();
    print("image url : " + downloadUrl);
    return downloadUrl;
  }
}

class FirebaseStorageAccess {
  static final Reference ref = FirebaseStorage.instance.ref();
  static FirebaseStorageAccess _instance;
  factory FirebaseStorageAccess() {
    if (_instance == null) {
      _instance = new FirebaseStorageAccess._();
    }

    return _instance;
  }

  const FirebaseStorageAccess._();

  Future<void> initialize() async {
    await Firebase.initializeApp();
    // await Firebase.initializeApp(
    //     name: 'com.inhouse.front',
    //     options: FirebaseOptions(
    //       appId: '',
    //       //  Platform.isIOS ? '' : '',
    //       apiKey: '',
    //       messagingSenderId: '',
    //       projectId: '',
    //     ));
  }
}
