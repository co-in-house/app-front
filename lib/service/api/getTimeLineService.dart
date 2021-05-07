import 'dart:convert';
import 'package:Inhouse/model/timeLine.dart';
import 'package:state_notifier/state_notifier.dart';

// 投稿TL Service class
class GetTimeLineService extends StateNotifier<TimeLine> {
  GetTimeLineService() : super(TimeLine());

  // 取得
  Future<void> call() async {
    print("GetTimeLineService Call");
    state = TimeLine(
      contentsList: state.contentsList,
      isLoading: true,
    );
    // テスト用
    await new Future.delayed(new Duration(seconds: 1));
    final response = _MockResponse();

    if (response.statusCode == 200) {
      print("GetTimeLineService Response: 200");
      TimeLine timeLine = TimeLine.fromJson(jsonDecode(response.body));
      state = timeLine;
    } else {
      throw Exception('Failed to get TimeLine');
    }
  }
}

class _MockResponse {
  int get statusCode => _statusCode;
  String get body => _body;

  int _statusCode = 200;
  String _body =
      '{"timeline": [ [{"img":"logo.png"},{"img":"ntt.png"},{"img":"ibm.png"}],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ]]}';
}
