import 'package:Inhouse/model/baseModel.dart';
import 'package:flutter/material.dart';

@immutable
class CommunityList extends BaseModel {
  CommunityList({
    this.contentsList, // 初期値null
    this.isLoading = false,
  });
  final List<Community> contentsList;
  final bool isLoading;

  factory CommunityList.fromJson(Map<String, dynamic> json) {
    List<dynamic> _list = json['communityList'];
    List<Community> obj = [];
    for (int i = 0; i < _list.length; i++) {
      List<Tag> _tags = [];
      List<dynamic> _tagList = _list[i]['tagList'];
      for (int j = 0; j < _tagList.length; j++) {
        if (_tagList[j]['tagType'] == 1) {
          _tags.add(Tag(
            tagId: _tagList[j]['tagId'],
            tagName: _tagList[j]['tagName'],
          ));
        }
      }
      var content = Community(
        communityId: _list[i]['communityId'],
        communityName: _list[i]['communityName'],
        content: _list[i]['content'],
        requirement: _list[i]['requirement'],
        locationId: _list[i]['locationId'],
        locationName: _list[i]['locationName'],
        note: _list[i]['note'],
        profileImgUrl: _list[i]['profileImgUrl'],
        headerImgUrl: _list[i]['headerImgUrl'],
        tags: _tags,
        created: _list[i]['created'],
      );
      obj.add(content);
    }
    return CommunityList(contentsList: obj, isLoading: false);
  }
}

class Community {
  Community({
    this.communityId,
    this.communityName,
    this.content,
    this.requirement,
    this.locationId,
    this.locationName,
    this.note,
    this.profileImgUrl,
    this.headerImgUrl,
    this.tags,
    this.created,
  });

  int communityId;
  String communityName;
  String content;
  String requirement;
  int locationId;
  String locationName;
  String note;
  String profileImgUrl;
  String headerImgUrl;
  String created;
  List<Tag> tags;
}

class Tag {
  Tag({
    this.tagId,
    this.tagName,
  });
  int tagId;
  String tagName;
}
