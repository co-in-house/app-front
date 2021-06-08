import 'package:Inhouse/component/timeline/postCard.dart';
import 'package:Inhouse/model/postList.dart';
import 'package:flutter/material.dart';

class PostCardList extends SliverChildListDelegate {
  PostCardList(PostList postList) : super(_PostList.buildEventList(postList));
}

class _PostList {
  static List<Widget> buildEventList(PostList postList) {
    print(postList);
    if (postList.contentsList == null || postList.contentsList.length == 0) {
      return [Text("No Content")];
    } else {
      List<Widget> list = [];
      for (int index = 0; index < postList.contentsList.length; index++) {
        list.add(PostCard(content: postList.contentsList[index]));
      }
      return list;
    }
  }
}