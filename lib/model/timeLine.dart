import 'package:Inhouse/model/baseModel.dart';
import 'package:flutter/material.dart';

@immutable
class TimeLine extends BaseModel {
  TimeLine({
    this.contentsList, // 初期値null
    this.isLoading = false,
  });
  final List<List<OneCardOnTimeLine>> contentsList;
  final bool isLoading;

  factory TimeLine.fromJson(Map<String, dynamic> json) {
    List<dynamic> _col = json['timeline'];
    List<List<OneCardOnTimeLine>> obj = [];
    for (int i = 0; i < _col.length; i++) {
      var _row = _col[i];
      List<OneCardOnTimeLine> rowContents = [];
      for (int j = 0; j < _row.length; j++) {
        var content = OneCardOnTimeLine(
          img: _row[j]['img'],
        );
        rowContents.add(content);
      }
      obj.add(rowContents);
    }
    return TimeLine(contentsList: obj, isLoading: false);
  }
}

class OneCardOnTimeLine {
  OneCardOnTimeLine({this.img});
  String img;
}
