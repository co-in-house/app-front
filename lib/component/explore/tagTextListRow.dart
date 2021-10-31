import 'package:inhouse/model/communityList.dart';
import 'package:flutter/material.dart';

class TagTextListRow extends StatelessWidget {
  TagTextListRow({this.tagList});
  final List<Tag> tagList;

  @override
  Widget build(BuildContext context) {
    if (tagList.isEmpty || tagList.length == 0) {
      return Text("No Tags");
    }
    List<Widget> list = [];
    for (int i = 0; i < tagList.length; i++) {
      list.add(
        Text(
          "#" + tagList[i].tagName,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    }
    return Row(children: list);
  }
}
