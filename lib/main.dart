import 'package:flutter/material.dart';
import './view/rootFlame.dart' as root;

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
      home: root.RootFlame(),
    );
  }
}
