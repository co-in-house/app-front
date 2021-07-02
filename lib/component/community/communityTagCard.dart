import 'package:Inhouse/component/community/communityInfoCardList.dart';
import 'package:Inhouse/component/text/tag.dart';
import 'package:flutter/material.dart';

class CommunityTagCard extends CommunityBaseCard {
  CommunityTagCard({this.tagLabelList});
  final List<String> tagLabelList;

  List<Widget> getWidgetList() {
    List<String> labelList = tagLabelList;
    List<Widget> tagList = List<Widget>.generate(
        labelList.length, (int index) => Tag(label: labelList[index]));

    // for test
    tagList.addAll([
      Tag(label: "タグです"),
      Tag(label: "タグ2です"),
      Tag(label: "this is tag3."),
      Tag(label: "タグ4です"),
      Tag(label: "とても長めのタグです"),
      Tag(label: "良きように省略・折り返してくれますよfuga hoge buzz"),
    ]);

    return tagList;
  }

  @override
  Widget buildChild(BuildContext context) {
    return Wrap(
      children: getWidgetList(),
    );
  }
}
