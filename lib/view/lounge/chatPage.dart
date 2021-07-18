import 'package:Inhouse/component/appBar.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("========ChatPage build========");
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBarChat(),
          SliverList(delegate: _ChatDelegate(context))
        ],
      ),
    );
  }
}

class _ChatDelegate extends SliverChildListDelegate {
  _ChatDelegate(BuildContext context) : super(_Chat.buildRoom(context));
  BuildContext context;
}

class _Chat {
  static List<Widget> buildRoom(BuildContext context) {
    List<Widget> list = List.generate(
        201,
        (index) => Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Text('hoge' + index.toString())));
    return list;
  }
}
