import 'package:Inhouse/component/community/communityInfoCardList.dart';
import 'package:Inhouse/component/text/tag.dart';
import 'package:flutter/material.dart';

class CommunityTagCard extends CommunityBaseCard {
  CommunityTagCard({this.tagLabelList});
  final List<String> tagLabelList;

  List<Widget> getWidgetList() {
    List<String> labelList = tagLabelList;
    List<Widget> tagList = List<Widget>.generate(
        labelList.length, (int index) => TagWidget(label: labelList[index]));

    // for test
    tagList.addAll([
      TagWidget(label: "タグです"),
      TagWidget(label: "タグ2です"),
      TagWidget(label: "this is tag3."),
      TagWidget(label: "タグ4です"),
      TagWidget(label: "とても長めのタグです"),
      TagWidget(label: "良きように省略・折り返してくれますよfuga hoge buzz"),
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
