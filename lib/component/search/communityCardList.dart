import 'package:Inhouse/component/search/communityCard.dart';
import 'package:Inhouse/model/communityList.dart';
import 'package:flutter/material.dart';

class CommunityCardList extends SliverChildListDelegate {
  CommunityCardList(CommunityList communityList)
      : super(_CommunityList.buildCommunityList(communityList));
}

class _CommunityList {
  static List<Widget> buildCommunityList(CommunityList communityList) {
    print(communityList);
    if (communityList.contentsList == null ||
        communityList.contentsList.length == 0) {
      return [Text("No Content")];
    } else {
      List<Widget> list = [];
      for (int index = 0; index < communityList.contentsList.length; index++) {
        list.add(CommunityCard(content: communityList.contentsList[index]));
      }
      return list;
    }
  }
}
