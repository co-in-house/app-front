import 'dart:convert';
import 'package:Inhouse/model/locationList.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:http/http.dart' as http;

// Location List Service class
class GetLocationListService extends StateNotifier<LocationList> {
  GetLocationListService() : super(LocationList());

  // 取得
  Future<void> call() async {
    print("GetLocationListService Call");
    state = LocationList(
      contentsList: state.contentsList,
      isLoading: true,
    );

    // final response =
    //     await http.get(Uri.https('app-service.mybluemix.net', 'v1/location'));

    // テスト用
    await new Future.delayed(new Duration(seconds: 1));
    final response = _MockResponse();

    if (response.statusCode == 200) {
      print("GetLocationListService Response: 200");
      LocationList locationList = LocationList.fromJson(
        jsonDecode(
          // utf8.decode(
          //   response.body.runes.toList(),
          // ),
          response.body,
        ),
      );
      state = locationList;
    } else {
      throw Exception('Failed to get LocationList');
    }
  }
}

class _MockResponse {
  int get statusCode => _statusCode;
  String get body => _body;

  int _statusCode = 200;
  String _body =
      '{"locationList": [{"index":1, "label":"東京"},{"index":2, "label":"京都"},{"index":3, "label":"北海道"},{"index":4, "label":"沖縄"},{"index":5, "label":"大阪"},{"index":6, "label":"青森"}]}';
}
