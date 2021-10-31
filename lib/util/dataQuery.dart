import 'dart:math';

import 'package:inhouse/model/community/JoinedCommunity.dart';
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

class EventImageDataQuery {
  static List<String> _list = [
    "dflt_com_01.png",
    "dflt_com_02.png",
    "dflt_com_03.png"
  ];
  static String getDefaultImgRandom() {
    var _target = _list[Random().nextInt(_list.length)];

    return 'images/default/$_target';
  }
}
