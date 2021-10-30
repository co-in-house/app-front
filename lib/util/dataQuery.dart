import 'package:Inhouse/model/community/JoinedCommunity.dart';
import 'package:flutter/material.dart';

class CommunityDataQuery {
  static Map<String, String> getBaiscInfoById({
    @required JoinedCommunityList joinedCommunityList,
    @required num communityId,
  }) {
    for (int i = 0; i < joinedCommunityList.contentsList.length; i++) {
      if (communityId == joinedCommunityList.contentsList[i].communityId) {
        return {
          "communityName": joinedCommunityList.contentsList[i].communityName,
          "iconImg": joinedCommunityList.contentsList[i].iconImg
        };
      }
    }
    return {};
  }
}
