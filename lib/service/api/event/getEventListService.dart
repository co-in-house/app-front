import 'dart:convert';
import 'package:inhouse/model/event/eventList.dart';
import 'package:inhouse/util/util.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:http/http.dart' as http;

// イベントTL Service class
class GetEventListService extends StateNotifier<EventMatrix> {
  GetEventListService() : super(EventMatrix());

  // 取得
  Future<void> call({@required List<num> communityIdList}) async {
    await new Future.delayed(new Duration(seconds: 10));
    print("GetEventListService Call");
    state = EventMatrix(
      contents: state.contents,
      isLoading: true,
    );
    String param = "";
    for (int i = 0; i < communityIdList.length; i++) {
      param = param + communityIdList[i].toString();
      param = param + ",";
    }
    param = param.substring(0, param.length - 1);

    final response = await http.get(
      Uri.https(Const.APP_SERVIE_HOST, 'service/api/event/list',
          {"communityids": param}),
    );

    // if (response.statusCode == 200) {
    //   print("200");

    //   JoinedCommunityList joinedCommunityList = JoinedCommunityList.fromJson(
    //     jsonDecode(
    //       utf8.decode(
    //         response.body.runes.toList(),
    //       ),
    //     ),
    //   );
    // テスト用
    // await new Future.delayed(new Duration(seconds: 1));
    // final response = _MockResponse();

    if (response.statusCode == 200) {
      print("GetEventListService Response: 200");
      EventMatrix eventMatrix = EventMatrix.fromJson(
        jsonDecode(
          utf8.decode(
            response.body.runes.toList(),
          ),
        ),
      );
      state = eventMatrix;
    } else {
      debugPrint("GetEventList : " + response.statusCode.toString());
      throw Exception('Failed to get EventList');
    }
  }
}

class _MockResponse {
  int get statusCode => _statusCode;
  String get body => _body;

  int _statusCode = 200;
  String _body =
      '''{"eventMatrix":[[{"communityId":1,"description":"コミュニティ1に紐づくエベント1","end":"2019-10-01 19:00:00.0","eventId":1,"location":"東京都千代田区紀尾井町７−１","start":"2019-10-01 12:00:00.0","thumbnailImg":"https://image.asoview-media.com/image/production/acp/3000016117/pln3000032120/a223704d-89ef-4326-931e-b382982edb25.jpeg","title":"テストイベント1"},{"communityId":1,"description":"コミュニティ1に紐づくエベント2","end":"2019-10-01 19:00:00.0","eventId":2,"location":"東京都千代田区紀尾井町７−１","start":"2019-10-01 12:00:00.0","thumbnailImg":"https://image2.30min.jp/30min/tweet/1206/461206.jpg","title":"テストイベント2"},{"communityId":1,"description":"コミュニティ1に紐づくエベント3","end":"2019-10-01 19:00:00.0","eventId":3,"location":"東京都千代田区紀尾井町７−１","start":"2019-10-01 12:00:00.0","thumbnailImg":"https://www.tv-asahi.co.jp/animesong_sousenkyo/OG.jpg","title":"テストイベント3"},{"communityId":2,"description":"コミュニティ2に紐づくエベント4","end":"2019-10-01 19:00:00.0","eventId":4,"location":"東京都千代田区紀尾井町７−１","start":"2019-10-01 12:00:00.0","thumbnailImg":"https://image2.30min.jp/30min/tweet/1206/461206.jpg","title":"テストイベント4"},{"communityId":2,"description":"コミュニティ2に紐づくエベント5","end":"2019-10-01 19:00:00.0","eventId":5,"location":"東京都千代田区紀尾井町７−１","start":"2019-10-01 12:00:00.0","thumbnailImg":"https://image.asoview-media.com/image/production/acp/3000016117/pln3000032120/a223704d-89ef-4326-931e-b382982edb25.jpeg","title":"テストイベント5"},{"communityId":1,"description":"コミュニティ1に紐づくイベントB","end":"2019-10-01 19:00:00.0","eventId":6,"location":"東京都千代田区紀尾井町７−１","start":"2019-10-01 12:00:00.0","thumbnailImg":"https://image.asoview-media.com/image/production/acp/3000016117/pln3000032120/a223704d-89ef-4326-931e-b382982edb25.jpeg","title":"テストイベントA"}],[{"communityId":1,"description":"コミュニティ1に紐づくエベント1","end":"2019-10-01 19:00:00.0","eventId":1,"location":"東京都千代田区紀尾井町７−１","start":"2019-10-01 12:00:00.0","thumbnailImg":"https://image.asoview-media.com/image/production/acp/3000016117/pln3000032120/a223704d-89ef-4326-931e-b382982edb25.jpeg","title":"テストイベント1"},{"communityId":1,"description":"コミュニティ1に紐づくエベント2","end":"2019-10-01 19:00:00.0","eventId":2,"location":"東京都千代田区紀尾井町７−１","start":"2019-10-01 12:00:00.0","thumbnailImg":"https://image2.30min.jp/30min/tweet/1206/461206.jpg","title":"テストイベント2"},{"communityId":1,"description":"コミュニティ1に紐づくエベント3","end":"2019-10-01 19:00:00.0","eventId":3,"location":"東京都千代田区紀尾井町７−１","start":"2019-10-01 12:00:00.0","thumbnailImg":"https://www.tv-asahi.co.jp/animesong_sousenkyo/OG.jpg","title":"テストイベント3"},{"communityId":2,"description":"コミュニティ2に紐づくエベント4","end":"2019-10-01 19:00:00.0","eventId":4,"location":"東京都千代田区紀尾井町７−１","start":"2019-10-01 12:00:00.0","thumbnailImg":"https://image2.30min.jp/30min/tweet/1206/461206.jpg","title":"テストイベント4"},{"communityId":2,"description":"コミュニティ2に紐づくエベント5","end":"2019-10-01 19:00:00.0","eventId":5,"location":"東京都千代田区紀尾井町７−１","start":"2019-10-01 12:00:00.0","thumbnailImg":"https://image.asoview-media.com/image/production/acp/3000016117/pln3000032120/a223704d-89ef-4326-931e-b382982edb25.jpeg","title":"テストイベント5"},{"communityId":1,"description":"コミュニティ1に紐づくイベントB","end":"2019-10-01 19:00:00.0","eventId":6,"location":"東京都千代田区紀尾井町７−１","start":"2019-10-01 12:00:00.0","thumbnailImg":"https://image.asoview-media.com/image/production/acp/3000016117/pln3000032120/a223704d-89ef-4326-931e-b382982edb25.jpeg","title":"テストイベントA"}]]}''';
}
