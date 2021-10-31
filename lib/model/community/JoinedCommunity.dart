import 'package:inhouse/model/baseModel.dart';
import 'package:flutter/material.dart';

@immutable
class JoinedCommunityList extends BaseModel {
  JoinedCommunityList({
    this.contentsList, // 初期値null
    this.isLoading = false,
  });
  final List<JoinedCommunity> contentsList;
  final bool isLoading;

  factory JoinedCommunityList.fromJson(Map<String, dynamic> json) {
    List<dynamic> _list = json['communityList'];
    List<JoinedCommunity> obj = [];
    for (int i = 0; i < _list.length; i++) {
      var content = JoinedCommunity(
          communityId: _list[i]['communityId'],
          communityName: _list[i]['communityName'],
          iconImg: _list[i]['iconImg']);
      obj.add(content);
    }
    return JoinedCommunityList(contentsList: obj, isLoading: false);
  }
}

class JoinedCommunity {
  JoinedCommunity({
    this.communityId,
    this.communityName,
    this.iconImg,
  });
  num communityId;
  String communityName;
  String iconImg;
}
