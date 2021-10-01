import 'package:Inhouse/model/baseModel.dart';
import 'package:flutter/material.dart';

@immutable
class EventList extends BaseModel {
  EventList({
    this.col, // 初期値null
    this.isLoading = false,
  });
  final List<List<OneCardOnEventList>> col;
  final bool isLoading;

  factory EventList.fromJson(Map<String, dynamic> json) {
    List<dynamic> _col = json['eventList'];
    List<List<OneCardOnEventList>> obj = [];
    for (int i = 0; i < _col.length; i++) {
      var _row = _col[i];
      List<OneCardOnEventList> rowContents = [];
      for (int j = 0; j < _row.length; j++) {
        var content = OneCardOnEventList(
          img: _row[j]['img'],
        );
        rowContents.add(content);
      }
      obj.add(rowContents);
    }
    return EventList(col: obj, isLoading: false);
  }
}

class OneCardOnEventList {
  OneCardOnEventList({this.img});
  String img;
  String eventDate = "12/25";
  String eventDayOfWeek = "Sat";
  String eventYear = "2021";

  String eventTitle = "おそ松さんスペシャルイベント";
  String eventDescription = "ここでしか見ることの出来ないシリーズ構成：松原秀による書きおろし新作朗読劇もお楽しみに！";

  int eventAmountOfMember = 12345;

  String communityName = "CommunityName";
  String communityId = "CommunityId";
  String communityIconUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwy4yt4ozcMfk1kGbhgMPxolXmlawudTRujQ&usqp=CAU";
}
