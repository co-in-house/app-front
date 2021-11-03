import 'package:inhouse/model/baseModel.dart';
import 'package:flutter/material.dart';
import 'package:inhouse/model/community/CommunityOverview.dart';

@immutable
class JoinedCommunityList extends BaseModel {
  JoinedCommunityList({
    this.contentsList, // 初期値null
    this.isLoading = false,
  });
  final List<CommunityOverview> contentsList;
  final bool isLoading;

  factory JoinedCommunityList.fromJson(Map<String, dynamic> json) {
    List<dynamic> _list = json['communityList'];
    List<CommunityOverview> obj = [];
    for (int i = 0; i < _list.length; i++) {
      var content = CommunityOverview(
          communityId: _list[i]['communityId'],
          communityName: _list[i]['communityName'],
          iconImg: _list[i]['iconImg']);
      obj.add(content);
    }
    return JoinedCommunityList(contentsList: obj, isLoading: false);
  }
}
