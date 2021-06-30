import 'package:Inhouse/component/community/communityInfoCardList.dart';
import 'package:flutter/material.dart';

class CommunityContentCard extends CommunityBaseCard {
  CommunityContentCard({this.content});
  final String content;

  String getSentence(String content) {
    if (content.isEmpty || content.trim() == null || content.trim() == '') {
      return "未入力";
    } else {
      return content;
    }
  }

  @override
  Widget buildChild(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Text("活動内容"), Text(getSentence(this.content))],
    );
  }
}
