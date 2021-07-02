import 'package:Inhouse/component/community/communityContentCard.dart';
import 'package:Inhouse/component/community/communityNoteCard.dart';
import 'package:Inhouse/component/community/communityRequirementCard.dart';
import 'package:Inhouse/component/community/communityTagCard.dart';
import 'package:Inhouse/model/communityList.dart';
import 'package:flutter/material.dart';

class CommunityInfoCardList extends SliverChildListDelegate {
  CommunityInfoCardList(BuildContext context, Community community)
      : super(_CommunityInfoCardList.build(context, community));
  BuildContext context;
}

class _CommunityInfoCardList {
  static List<Widget> build(BuildContext context, Community community) {
    print("build CommunityInfoCardList");
    List<Widget> list = [];
    list.add(CommunityTagCard(tagLabelList: community.getTagLabelList()));
    list.add(CommunityContentCard(content: community.content));
    list.add(CommunityRequirementCard(requirement: community.requirement));
    list.add(CommunityNoteCard(note: community.note));

    list.add(SizedBox(height: MediaQuery.of(context).size.height * 0.05));
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
