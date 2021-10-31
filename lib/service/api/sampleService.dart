import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inhouse/model/sample.dart';
import 'package:state_notifier/state_notifier.dart';

// sample post service
class SampleService extends StateNotifier<Sample> {
  SampleService() : super(Sample());

  void call(String name) async {
    state = Sample(
      count: state.count,
      message: state.message,
      isLoading: true,
    );
    final response = await http.post(
      Uri.https('app-service.mybluemix.net', 'v1/sample'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
      }),
    );
    if (response.statusCode == 200) {
      print("200");
      Sample sample = Sample.fromJson(jsonDecode(response.body));
      state = Sample(
        count: sample.count,
        message: sample.message + " " + sample.count.toString() + "回目のsubmit",
        isLoading: false,
      );
    } else {
      throw Exception('Failed to post sample');
    }
  }
}
