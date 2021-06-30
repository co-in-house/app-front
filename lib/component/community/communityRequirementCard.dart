import 'package:Inhouse/component/community/communityInfoCardList.dart';
import 'package:flutter/material.dart';

class CommunityRequirementCard extends CommunityBaseCard {
  CommunityRequirementCard({this.requirement});
  final String requirement;

  String getSentence(String requirement) {
    if (requirement.isEmpty ||
        requirement.trim() == null ||
        requirement.trim() == '') {
      return "未入力";
    } else {
      return requirement;
    }
  }

  @override
  Widget buildChild(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Text("入会条件"), Text(getSentence(this.requirement))],
    );
  }
}
