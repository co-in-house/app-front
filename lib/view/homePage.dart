import 'package:Inhouse/component/postCard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     Text('Home Page'),
    //     PostCard(),
    //   ],
    // );
    // return PostCard();
    return ListView(scrollDirection: Axis.vertical, children: <Widget>[
      PostCard(),
      PostCard(),
      PostCard(),
      PostCard(),
    ]);
  }
}
