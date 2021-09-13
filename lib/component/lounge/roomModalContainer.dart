import 'package:Inhouse/component/lounge/roomButton.dart';
import 'package:Inhouse/util/inhouseWidget.dart';
import 'package:flutter/material.dart';

class RoomModalContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> activeList = [
      ActiveRoomButton(index: 1, label: "部屋の名前！"),
      ActiveRoomButton(index: 2, label: "あれ"),
      ActiveRoomButton(index: 3, label: "こういうことなのか？"),
    ];
    List<Widget> closedList = [
      ClosedRoomButton(index: 1, label: "とりあえず"),
      ClosedRoomButton(index: 2, label: "グレーっしょ"),
      ClosedRoomButton(index: 3, label: "こういうことなのか？"),
    ];

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InhouseWidget.toggleContainer(),
          RoomModalContentHeader(
            label: "開催中ルーム",
          ),
          RoomModalContentRow(
            contentList: activeList,
          ),
          RoomModalContentHeader(
            label: "過去ルーム",
          ),
          RoomModalContentRow(
            contentList: closedList,
          ),
        ],
      ),
    );
  }
}

class RoomModalContentHeader extends StatelessWidget {
  const RoomModalContentHeader({Key key, @required this.label})
      : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(
        top: 4,
        bottom: 4,
        left: 10,
        right: 10,
      ),
      child: Text(
        this.label,
        style: TextStyle(
          color: Colors.black,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class RoomModalContentRow extends StatelessWidget {
  const RoomModalContentRow({Key key, this.contentList}) : super(key: key);
  final List<Widget> contentList;

  @override
  Widget build(BuildContext context) {
    Widget _child;
    if (contentList == null || contentList.isEmpty) {
      _child = Text("No CONTENT!");
    } else {
      _child = SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: this.contentList,
        ),
      );
    }
    return Container(child: _child);
  }
}
