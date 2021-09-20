import 'package:Inhouse/component/appBar/sliverAppBarChat.dart';
import 'package:Inhouse/component/bottomBar/chatBottomBar.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key key, @required this.roomName}) : super(key: key);
  final String roomName;

  @override
  Widget build(BuildContext context) {
    print("========ChatPage build========");
    return GestureDetector(
      child: Scaffold(
        body: Container(
          // color: Colors.white,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBarChat(roomName: this.roomName),
              SliverList(delegate: _ChatDelegate(context)),
            ],
          ),
        ),
        bottomNavigationBar: ChatBottomBar(),
      ),
      onTap: () {
        FocusScope.of(context).unfocus();
      },
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
      50,
      (index) => Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Container(
          padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
          child: Align(
            alignment:
                (index % 2 == 0 ? Alignment.topLeft : Alignment.topRight),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:
                    (index % 2 == 0 ? Colors.grey.shade200 : Colors.green[100]),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                "TestMessage" + index.toString(),
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ),
      ),
    );

    return list;
  }
}
