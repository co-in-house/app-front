import 'package:Inhouse/component/community/communityContentContainer.dart';
import 'package:Inhouse/component/loading/loadingDialog.dart';
import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:Inhouse/service/api/postNewCommunityService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewCommunityInfoCardList extends SliverChildListDelegate {
  NewCommunityInfoCardList(
      BuildContext context, NewCommunityInfo newCommunityInfo)
      : super(_CommunityInfoCardList.build(context, newCommunityInfo));
  BuildContext context;
}

class _CommunityInfoCardList {
  static List<Widget> build(
      BuildContext context, NewCommunityInfo newCommunityInfo) {
    print("build NewCommunityInfoCardList");
    List<Widget> list = [];
    // list.add(CommunityTagRow(tagLabelList: newCommunityInfo.getTagLabelList()));
    list.add(CommunityBasicInfoContainer(
      labelList: newCommunityInfo.getTagLabelList(),
      location: newCommunityInfo.selectedLocation.label,
      subscriber: 1729,
    ));
    // list.add(
    // CommunityRequirementCard(requirement: newCommunityInfo.requirement));
    // list.add(CommunityNoteCard(note: newCommunityInfo.note));
    list.add(
      ElevatedButton(
        child: Text("作成する"),
        style: ElevatedButton.styleFrom(elevation: 0),
        onPressed: () async {
          print("confirm");
          await LoadingDialog().showIndicator(context);
          await context.read<PostNewCommunityService>().call(newCommunityInfo);
          await LoadingDialog().showCompleted(context);
          Navigator.popUntil(context, (route) => route.isFirst);
        },
      ),
    );
    list.add(SizedBox(height: MediaQuery.of(context).size.height * 0.05));
    return list;
  }
}
