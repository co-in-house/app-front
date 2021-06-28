import 'dart:convert';
import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:http/http.dart' as http;
import 'package:state_notifier/state_notifier.dart';

// コミュニティ新規作成
class PostNewCommunityService extends StateNotifier<NewCommunityInfo> {
  PostNewCommunityService() : super(NewCommunityInfo());

  Future<void> call(NewCommunityInfo newCommunityInfo) async {
    List<String> l = [];
    newCommunityInfo.isLoading = true;
    state = newCommunityInfo;
    final String _body = jsonEncode(newCommunityInfo);
    final response = await http.post(
      // Uri.https('app-service.mybluemix.net', 'v1/community'),
      Uri.http('localhost:8080', 'v1/community'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: _body,
    );
    print("POST NewCommunity body : " + _body);

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
      state = NewCommunityInfo();
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
