import 'dart:convert';
import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:http/http.dart' as http;
import 'package:state_notifier/state_notifier.dart';

// コミュニティ新規作成
class PostNewCommunityService extends StateNotifier<NewCommunityInfo> {
  PostNewCommunityService() : super(NewCommunityInfo());

  Future<void> call(NewCommunityInfo newCommunityInfo) async {
    newCommunityInfo.isLoading = true;
    state = newCommunityInfo;
    // final response = await http.post(
    //   Uri.https('app-service.mybluemix.net', 'v1/community'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(<String, String>{
    //     'testKey': 'testValue',
    //   }),
    // );

    // テスト用
    await new Future.delayed(new Duration(seconds: 2));
    final response = _MockResponse();

    if (response.statusCode == 200) {
      print("200");
      // stateの初期化
      state = NewCommunityInfo();
    } else {
      throw Exception('Failed to post NewCommunity Service');
    }
  }
}

class _MockResponse {
  int get statusCode => _statusCode;
  String get body => _body;

  int _statusCode = 200;
  String _body = '{}';
}
