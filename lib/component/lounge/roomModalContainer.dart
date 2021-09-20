import 'package:Inhouse/component/icon/iconContainer.dart';
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
          InhouseWidget.dividerContainer(),
          RoomModalCommunityInfoRow(additionalWidgetList: []),
          InhouseWidget.dividerContainer(),
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
          NewRoomButton(),
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

class RoomModalCommunityInfoRow extends StatelessWidget {
  const RoomModalCommunityInfoRow({Key key, this.additionalWidgetList})
      : super(key: key);
  final List<Widget> additionalWidgetList;

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = [
      IconContainer(
        size: 60,
        url:
            "https://64.media.tumblr.com/0317820d16f6aa4dfb218964540d5ca2/8e115be96e0d0f3e-ff/s1280x1920/d1605a5ea98ad3136f1e6ab435fd76757fc12609.jpg",
      ),
      Expanded(
        child: Text(
          "コミュニティ名出そコミュニティ名出そコミュニティ名出そコミュニティ名出そコミュニティ名出そ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ];
    if (additionalWidgetList != null && additionalWidgetList.length > 0) {
      _children.addAll(additionalWidgetList);
    }
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(
        top: 4,
        bottom: 4,
        left: 10,
        right: 10,
      ),
      child: Row(
        children: _children,
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
