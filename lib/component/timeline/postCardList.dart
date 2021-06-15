import 'package:Inhouse/component/timeline/postCard.dart';
import 'package:Inhouse/model/postList.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';

class PostCardList extends SliverChildListDelegate {
  PostCardList(BuildContext context, PostList postList)
      : super(_PostList.buildPostList(context, postList));
  BuildContext context;
}

class _PostList {
  static List<Widget> buildPostList(BuildContext context, PostList postList) {
    print("buildPostList");
    if (postList.contentsList == null) {
      return [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width *
                Const.containerWidthPercentage,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LinearProgressIndicator(),
                ]),
          ),
        ),
      ];
    } else if (postList.contentsList.length == 0) {
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
