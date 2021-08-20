import 'package:Inhouse/component/community/communityAlbumContainer.dart';
import 'package:Inhouse/component/community/communityContentContainer.dart';
import 'package:Inhouse/component/community/communityInfoDivider.dart';
import 'package:Inhouse/component/community/communityOpenChatRow.dart';
import 'package:Inhouse/component/community/communiyCutIconRow.dart';
import 'package:Inhouse/model/communityList.dart';
import 'package:Inhouse/util/util.dart';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CommunityInfoListDelegate extends SliverChildListDelegate {
  CommunityInfoListDelegate(BuildContext context, Community community)
      : super(_CommunityInfoListDelegate.build(context, community));
  BuildContext context;
}

class _CommunityInfoListDelegate {
  static List<Widget> build(BuildContext context, Community community) {
    print("build CommunityInfoCardList");
    List<Widget> list = [];
    list.add(CommunityOnAirCutListRow(
      urlList: [
        'https://66.media.tumblr.com/c063f0b98040e8ec4b07547263b8aa15/tumblr_inline_ppignaTjX21s9on4d_540.jpg',
        'https://64.media.tumblr.com/791392df90cb390e7a1076bdc9547ffd/tumblr_ptj0tqzT2A1thp44k_1280.png',
        'https://64.media.tumblr.com/ad28b1e0e8a8e3762083708fca19c844/c850b465b1b09754-9d/s640x960/b83ffe042291de6e8f2d9bc34d547903975afa46.jpg',
        'https://66.media.tumblr.com/c063f0b98040e8ec4b07547263b8aa15/tumblr_inline_ppignaTjX21s9on4d_540.jpg',
        'https://64.media.tumblr.com/791392df90cb390e7a1076bdc9547ffd/tumblr_ptj0tqzT2A1thp44k_1280.png',
        'https://64.media.tumblr.com/ad28b1e0e8a8e3762083708fca19c844/c850b465b1b09754-9d/s640x960/b83ffe042291de6e8f2d9bc34d547903975afa46.jpg',
        'https://66.media.tumblr.com/c063f0b98040e8ec4b07547263b8aa15/tumblr_inline_ppignaTjX21s9on4d_540.jpg',
        'https://64.media.tumblr.com/791392df90cb390e7a1076bdc9547ffd/tumblr_ptj0tqzT2A1thp44k_1280.png',
        'https://64.media.tumblr.com/ad28b1e0e8a8e3762083708fca19c844/c850b465b1b09754-9d/s640x960/b83ffe042291de6e8f2d9bc34d547903975afa46.jpg',
      ],
    ));
    list.add(CommunityInfoDivider());
    list.add(CommunityOpenChatRow());
    list.add(CommunityInfoDivider());
    list.add(CommunityBasicInfoContainer(
      labelList: community.getTagLabelList(),
      location: community.locationName,
      subscriber: 1729,
    ));
    list.add(CommunityInfoDivider());
    list.add(CommunityAlbumListContainer(
      communityName: community.communityName,
    ));

    list.add(SizedBox(height: MediaQuery.of(context).size.height * 0.05));
    return list;
  }
}

abstract class CommunityBaseContainer extends StatelessWidget {
  buildChild(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final double _horizontalMargin = (MediaQuery.of(context).size.width *
            (1 - Const.containerWidthPercentage)) /
        2;
    return Container(
      child: buildChild(context),
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      margin:
          EdgeInsets.symmetric(vertical: 6.0, horizontal: _horizontalMargin),
      alignment: Alignment.center,
    );
  }
}
