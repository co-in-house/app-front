import 'package:Inhouse/component/lounge/roomModalContainer.dart';
import 'package:Inhouse/util/inhouseWidget.dart';
import 'package:flutter/material.dart';

class NewRoomModalContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InhouseWidget.toggleContainer(),
          InhouseWidget.dividerContainer(),
          RoomModalCommunityInfoRow(),
          InhouseWidget.dividerContainer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Icon(Icons.house),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextField(
                  decoration: InputDecoration(hintText: "ルーム名とかどうしますかー"),
                  style: TextStyle(height: 1.2),
                ),
              ),
            ],
          ),
          Text("オープンにしますかーボタンとか"),
          Text("コミュニティ内にしますかーボタンとか"),
          Text("なんかいろいろ出しますか"),

          // RoomModalContentHeader(
          //   label: "開催中ルーム",
          // ),
          // RoomModalContentRow(
          //   contentList: activeList,
          // ),
          // RoomModalContentHeader(
          //   label: "過去ルーム",
          // ),
          // RoomModalContentRow(
          //   contentList: closedList,
          // ),
        ],
      ),
    );
  }
}
