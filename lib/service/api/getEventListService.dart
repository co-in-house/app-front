import 'dart:convert';
import 'package:Inhouse/model/eventList.dart';
import 'package:state_notifier/state_notifier.dart';

// イベントTL Service class
class GetEventListService extends StateNotifier<EventList> {
  GetEventListService() : super(EventList());

  // 取得
  Future<void> call() async {
    print("GetEventListService Call");
    state = EventList(
      col: state.col,
      isLoading: true,
    );
    // テスト用
    await new Future.delayed(new Duration(seconds: 1));
    final response = _MockResponse();

    if (response.statusCode == 200) {
      print("GetEventListService Response: 200");
      EventList eventList = EventList.fromJson(jsonDecode(response.body));
      state = eventList;
    } else {
      throw Exception('Failed to get EventList');
    }
  }
}

class _MockResponse {
  int get statusCode => _statusCode;
  String get body => _body;

  int _statusCode = 200;
  // String _body =
  //     '{"eventList": [ [{"img":"logo.png"},{"img":"ntt.png"},{"img":"ibm.png"}],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ],[{"img":"ibm.png"}],[{"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"} ],[{"img":"logo.png"},{"img":"ntt.png"} ]]}';
  String _body = '''{"eventList": [ 
        [
          {"img":"ibm.png"},{"img":"logo.png"},{"img":"ntt.png"}
        ],
        [
          {"img":"ibm.png"}
        ],
        [
          {"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"}
        ],
           [
          {"img":"logo.png"},{"img":"ntt.png"},{"img":"ibm.png"}
        ],
        [
          {"img":"ibm.png"}
        ],
        [
          {"img":"ntt.png"},{"img":"ibm.png"},{"img":"logo.png"}
        ]
      ]
    }''';
}
