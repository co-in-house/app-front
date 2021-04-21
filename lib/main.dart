import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inhouse Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Inhouse Sample Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  Future<Sample> _futureSample;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                setState(() {
                  _futureSample = postSample(_controller.text);
                });
              },
            ),
            FutureBuilder<Sample>(
              future: _futureSample,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done &&
                    _futureSample != null) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasData) {
                  return Text(snapshot.data.message +
                      " " +
                      snapshot.data.count.toString() +
                      "回目のsubmit");
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else {
                  return Text("submit押してね");
                }
              },
            ),
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
