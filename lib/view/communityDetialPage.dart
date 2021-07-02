import 'package:Inhouse/component/appBar.dart';
import 'package:Inhouse/component/community/communityInfoCardList.dart';
import 'package:Inhouse/model/communityList.dart';
import 'package:flutter/material.dart';

class CommunityDetailPage extends StatelessWidget {
  CommunityDetailPage({Key key, this.community}) : super(key: key);
  final Community community;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.newCommunityDetail(context),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBarCommunityImage(
            // imagePath: community.profileImgUrl,
            imagePath: 'images/bg_f.jpg',
            label: community.communityName,
            locationLabel: community.locationName,
          ),
          SliverList(delegate: CommunityInfoCardList(context, this.community)),
        ],
      ),
    );
  }
}
