import 'package:Inhouse/component/appBar.dart';
import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:flutter/material.dart';

class TestConfirm extends StatelessWidget {
  TestConfirm({Key key, this.newCommunityInfo}) : super(key: key);
  final NewCommunityInfo newCommunityInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.newCommunity(context),
      body: Center(
        child: Text(
          newCommunityInfo.toString(),
        ),
      ),
    );
  }
}
