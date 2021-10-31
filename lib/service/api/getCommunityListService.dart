import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inhouse/model/communityList.dart';
import 'package:state_notifier/state_notifier.dart';

// Community Service class
class GetCommunityListService extends StateNotifier<CommunityList> {
  GetCommunityListService() : super(CommunityList());

  // 取得
  Future<void> call(String keyword) async {
    print("GetCommunityListService Call");
    state = CommunityList(
      contentsList: state.contentsList,
      isLoading: true,
    );
    // // テスト用
    await new Future.delayed(new Duration(seconds: 1));
    final response = _MockResponse();

    // final response = await http.get(
    //   Uri.https(
    //     'app-service.mybluemix.net',
    //     'v1/community/list',
    //     {
    //       "keyword": keyword,
    //     },
    //   ),
    //   headers: {},
    // );

    if (response.statusCode == 200) {
      print("GetCommunityListService Response: 200");

      CommunityList eventList = CommunityList.fromJson(
        jsonDecode(
          // utf8.decode(
          //   response.body.runes.toList(),
          // ),
          response.body,
        ),
      );

      state = eventList;
    } else {
      print("response status: " + response.statusCode.toString());
      throw Exception('Failed to get CommunityList');
    }
  }
}

class _MockResponse {
  int get statusCode => _statusCode;
  String get body => _body;

  int _statusCode = 200;
  String _body =
      '{"communityList":[{"communityId":1,"communityName":"inhouse-dev","content":"活動内容1","locationId":1,"locationName":"東京","note":"備考","profileImgUrl":null,"headerImgUrl":null,"tagList":[{"tagId":1,"tagName":"inhouse-dev","communityId":1,"tagType":0},{"tagId":2,"tagName":"hoge","communityId":1,"tagType":1},{"tagId":3,"tagName":"tag-2","communityId":1,"tagType":1},{"tagId":4,"tagName":"tag-3","communityId":1,"tagType":1}],"primaryUserList":null,"created":"2021-06-05T09:54:51.000+00:00","modified":null}]}';
}
