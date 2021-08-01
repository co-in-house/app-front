import 'package:Inhouse/model/baseModel.dart';
import 'package:flutter/material.dart';

@immutable
class CutList extends BaseModel {
  CutList({
    this.contentsList, // 初期値null
    this.isLoading = false,
  });
  final List<OneCut> contentsList;
  final bool isLoading;

  factory CutList.fromJson(Map<String, dynamic> json) {
    List<dynamic> _list = json['cutList'];
    List<OneCut> obj = [];
    for (int i = 0; i < _list.length; i++) {
      var content = OneCut(
        img: _list[i]['img'],
      );
      obj.add(content);
    }
    return CutList(contentsList: obj, isLoading: false);
  }
}

class OneCut {
  OneCut({this.img});
  String img;
}
