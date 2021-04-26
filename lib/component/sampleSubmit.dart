// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:async';

// class ReusableButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final Color color;

//   ReusableButton({@required this.onPressed, this.color});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: RaisedButton(
//           onPressed: onPressed, color: color, child: Text("Function B")),
//     );
//   }
// }

// // 非同期 post
// Future<Sample> postSample(String name) async {
//   final response = await http.post(
//     Uri.https('app-service.mybluemix.net', 'v1/sample'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'name': name,
//     }),
//   );
//   if (response.statusCode == 200) {
//     return Sample.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to post sample');
//   }
// }

// class Sample {
//   final int count;
//   final String message;

//   Sample({this.count, this.message});

//   factory Sample.fromJson(Map<String, dynamic> json) {
//     return Sample(
//       count: json['count'],
//       message: json['message'],
//     );
//   }
// }
