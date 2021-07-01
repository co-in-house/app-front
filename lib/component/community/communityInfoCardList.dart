import 'package:Inhouse/component/community/communityContentCard.dart';
import 'package:Inhouse/component/community/communityNoteCard.dart';
import 'package:Inhouse/component/community/communityRequirementCard.dart';
import 'package:Inhouse/component/community/communityTagCard.dart';
import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:flutter/material.dart';

class CommunityInfoCardList extends SliverChildListDelegate {
  CommunityInfoCardList(BuildContext context, NewCommunityInfo newCommunityInfo)
      : super(_CommunityInfoCardList.build(context, newCommunityInfo));
  BuildContext context;
}

class _CommunityInfoCardList {
  static List<Widget> build(
      BuildContext context, NewCommunityInfo newCommunityInfo) {
    print("build CommunityInfoCardList");
    List<Widget> list = [];
    list.add(TagCard(newCommunityInfo: newCommunityInfo));
    list.add(CommunityContentCard(content: newCommunityInfo.content));
    list.add(
        CommunityRequirementCard(requirement: newCommunityInfo.requirement));
    list.add(CommunityNoteCard(note: newCommunityInfo.note));
    return list;
  }
}

abstract class CommunityBaseCard extends StatelessWidget {
  Widget buildChild(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 2.0,
      child: Container(
        child: buildChild(context),
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
        alignment: Alignment.topCenter,
      ),
      margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
    );
  }
}