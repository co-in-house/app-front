import 'package:Inhouse/component/appBar.dart';
import 'package:flutter/material.dart';

class CommunityTagPage extends StatefulWidget {
  CommunityTagPage({Key key, this.argument}) : super(key: key);
  final String argument;

  @override
  _CommunityTagState createState() => _CommunityTagState();
}

class _CommunityTagState extends State<CommunityTagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarCommunity.tag(context),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("you submitted " + widget.argument + "!"),
            ],
          ),
        ),
      ),
    );
  }
}
