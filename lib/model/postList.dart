import 'package:Inhouse/model/baseModel.dart';
import 'package:flutter/material.dart';

@immutable
class PostList extends BaseModel {
  PostList({
    this.contentsList, // 初期値null
    this.isLoading = false,
  });
  final List<OneCardOnPostList> contentsList;
  final bool isLoading;

  factory PostList.fromJson(Map<String, dynamic> json) {
    List<dynamic> _list = json['postList'];
    List<OneCardOnPostList> obj = [];
    for (int i = 0; i < _list.length; i++) {
      var content = OneCardOnPostList(
        img: _list[i]['img'],
      );
      obj.add(content);
    }
    return PostList(contentsList: obj, isLoading: false);
  }
}

class OneCardOnPostList {
  OneCardOnPostList({this.img});
  String img;
}
