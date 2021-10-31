import 'package:inhouse/model/baseModel.dart';
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
        communityId: _list[i]['communityId'],
        communityName: _list[i]['communityName'],
        description: _list[i]['description'],
        iconUrl: _list[i]['iconUrl'],
        videoUrl: _list[i]['videoUrl'],
      );
      obj.add(content);
    }
    return CutList(contentsList: obj, isLoading: false);
  }
}

class OneCut {
  OneCut({
    this.communityId,
    this.communityName,
    this.description,
    this.iconUrl,
    this.videoUrl,
  });
  String iconUrl;
  String videoUrl;
  String description;
  String communityName;
  int communityId;
}
