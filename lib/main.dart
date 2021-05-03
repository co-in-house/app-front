import 'package:Inhouse/util/theme.dart';
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
      title: 'Inhouse',
      theme: inhouseThemeColor,
      home: root.RootFlame(),
    );
  }
}
