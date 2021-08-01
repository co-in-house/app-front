import 'dart:convert';
import 'package:Inhouse/model/cutList.dart';
import 'package:state_notifier/state_notifier.dart';

// Cut Service class
class GetCutListService extends StateNotifier<CutList> {
  GetCutListService() : super(CutList());

  // 取得
  Future<void> call() async {
    print("GetCutListService Call");
    state = CutList(
      contentsList: state.contentsList,
      isLoading: true,
    );
    // テスト用
    await new Future.delayed(new Duration(seconds: 1));
    final response = _MockResponse();

    if (response.statusCode == 200) {
      print("GetCutListService Response: 200");
      CutList cutList = CutList.fromJson(jsonDecode(response.body));
      state = cutList;
    } else {
      throw Exception('Failed to get CutList');
    }
  }
}

class _MockResponse {
  int get statusCode => _statusCode;
  String get body => _body;

  int _statusCode = 200;
  String _body =
      '{"cutList": [{"img":"jojo.jpg"},{"img":"jojo2.jpg"},{"img":"jojo3.jpg"},{"img":"jojo.jpg"},{"img":"jojo2.jpg"},{"img":"jojo3.jpg"},{"img":"jojo.jpg"},{"img":"jojo2.jpg"},{"img":"jojo3.jpg"}]}';
}
