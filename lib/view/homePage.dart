import 'package:Inhouse/component/timeline/postCardRowList.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: PostCardRowList(),
        ),
      ],
    );
  }
}
