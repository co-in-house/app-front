import 'package:inhouse/component/appBar/sliverAppBarCommunityDetail.dart';
import 'package:inhouse/component/community/communityInfoListDelegate.dart';
import 'package:inhouse/model/communityList.dart';
import 'package:flutter/material.dart';

class CommunityDetailPage extends StatelessWidget {
  CommunityDetailPage({Key key, this.community, this.genreId})
      : super(key: key);
  final Community community;
  final int genreId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar.newCommunityDetail(context),
      // extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBarCommunityDetail(
            imagePath: (community.profileImgUrl == null ||
                    community.profileImgUrl.trim().isEmpty)
                ? 'images/bg_f.jpg'
                : community.profileImgUrl,
            communityName: community.communityName,
            id: community.communityId,
            genreId: genreId,
            cheer: 12345,
          ),
          SliverList(
              delegate: CommunityInfoListDelegate(context, this.community)),
        ],
      ),
    );
  }
}
