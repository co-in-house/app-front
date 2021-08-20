import 'package:Inhouse/component/appBar.dart';
import 'package:Inhouse/component/community/newCommunity/newCommunityInfoCardList.dart';
import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:flutter/material.dart';

class NewCommunityConfirmPage extends StatelessWidget {
  NewCommunityConfirmPage({Key key, this.newCommunityInfo}) : super(key: key);
  final NewCommunityInfo newCommunityInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.newCommunityConfirm(context),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBarCommunityImage(
            imagePath: newCommunityInfo.iconImg.path,
            communityName: newCommunityInfo.name,
            id: null,
            cheer: null,
          ),
          SliverList(
              delegate:
                  NewCommunityInfoCardList(context, this.newCommunityInfo)),
        ],
      ),
    );
  }
}
