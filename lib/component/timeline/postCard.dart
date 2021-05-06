import 'package:Inhouse/model/timeLine.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final OneCardOnTimeLine content;
  PostCard({this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 2.0,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        width: 300,
        height: 100,
        alignment: Alignment.topCenter,
        child: Image.asset('images/' + content.img, fit: BoxFit.fill),
      ),
    );
  }
}
