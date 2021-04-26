import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './view/homePage.dart' as homePage;

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
      home: ChangeNotifierProvider(
        create: (context) => homePage.SamplePostThenNotice(),
        child: homePage.MyHomePage(),
      ),
    );
  }
}
