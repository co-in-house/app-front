import 'dart:convert';
import 'package:Inhouse/model/postList.dart';
import 'package:state_notifier/state_notifier.dart';

// 投稿TL Service class
class GetPostListService extends StateNotifier<PostList> {
  GetPostListService() : super(PostList());

  // 取得
  Future<void> call() async {
    print("GetPostListService Call");
    state = PostList(
      contentsList: state.contentsList,
      isLoading: true,
    );
    // テスト用
    await new Future.delayed(new Duration(seconds: 1));
    final response = _MockResponse();

    if (response.statusCode == 200) {
      print("GetPostListService Response: 200");
      PostList postList = PostList.fromJson(jsonDecode(response.body));
      state = postList;
    } else {
      throw Exception('Failed to get PostList');
    }
  }
}

class _MockResponse {
  int get statusCode => _statusCode;
  String get body => _body;

  int _statusCode = 200;
  String _body =
      '{"postList": [{"img":"logo.png"},{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"},{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"},{"img":"ntt.png"},{"img":"ibm.png"}]}';
}
