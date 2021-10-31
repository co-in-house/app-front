import 'dart:convert';
import 'package:inhouse/model/tagList.dart';
import 'package:state_notifier/state_notifier.dart';

// Tag List Service class
class GetTagListService extends StateNotifier<TagList> {
  GetTagListService() : super(TagList());

  // 取得
  Future<void> call() async {
    print("GetTagListService Call");
    state = TagList(
      contentsList: state.contentsList,
      isLoading: true,
    );
    // テスト用
    await new Future.delayed(new Duration(seconds: 1));
    final response = _MockResponse();

    if (response.statusCode == 200) {
      print("GetTagListService Response: 200");
      TagList tagList = TagList.fromJson(jsonDecode(response.body));
      state = tagList;
    } else {
      throw Exception('Failed to get TagList');
    }
  }
}

class _MockResponse {
  int get statusCode => _statusCode;
  String get body => _body;

  int _statusCode = 200;
  String _body =
      '{"tagList": [{"index":99, "label":"テスト用"},{"index":1, "label":"音楽"},{"index":2, "label":"運動"},{"index":3, "label":"文化"}]}';
}
