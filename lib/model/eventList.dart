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
}
