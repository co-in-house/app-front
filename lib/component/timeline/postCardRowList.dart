import 'package:Inhouse/component/timeline/postCardRow.dart';
import 'package:Inhouse/model/timeLine.dart';
import 'package:flutter/material.dart';

class PostCardRowList extends SliverChildListDelegate {
  PostCardRowList(TimeLine timeLine) : super(_TimeLine.buildTimeLine(timeLine));
}

class _TimeLine {
  static List<Widget> buildTimeLine(TimeLine timeLine) {
    print(timeLine);
    if (timeLine.contentsList == null || timeLine.contentsList.length == 0) {
      return [Text("No Content")];
    } else {
      List<Widget> list = [];
      for (int index = 0; index < timeLine.contentsList.length; index++) {
        list.add(PostCardRow(row: timeLine.contentsList[index]));
      }
      return list;
    }
  }
}
