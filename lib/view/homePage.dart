import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class TestText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final message = context
        .select((SamplePostThenNotice sampleModel) => sampleModel.message);
    return Text("$message");
  }
}

class MyHomePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inhouse Sample Page'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: 'Enter Your Name !'),
            ),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                context.read<SamplePostThenNotice>().postTest(_controller.text);
              },
            ),
            TestText(),
          ],
        ),
      ),
    );
  }
}

// 非同期 post
Future<Sample> postSample(String name) async {
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
    return Sample.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post sample');
  }
}

class Sample {
  final int count;
  final String message;

  Sample({this.count, this.message});

  factory Sample.fromJson(Map<String, dynamic> json) {
    return Sample(
      count: json['count'],
      message: json['message'],
    );
  }
}

// test notice post
class SamplePostThenNotice with ChangeNotifier {
  Sample sample;
  String message = "submitを押してね";
  void postTest(String name) async {
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
      sample = Sample.fromJson(jsonDecode(response.body));
      message = sample.message + " " + sample.count.toString() + "回目のsubmit";
      notifyListeners();
    } else {
      throw Exception('Failed to post sample');
    }
  }
}
