import 'package:Inhouse/model/sample.dart';
import 'package:flutter/material.dart';

class SampleMessage extends StatelessWidget {
  final Sample sample;
  SampleMessage({this.sample});
  @override
  Widget build(BuildContext context) {
    if (sample.isLoading) {
      return CircularProgressIndicator();
    } else {
      return Text(this.sample.message);
    }
  }
}
