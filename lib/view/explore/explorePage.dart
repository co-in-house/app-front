import 'package:inhouse/component/appBar/sliverAppBarExplore.dart';
import 'package:inhouse/component/explore/communityCardList.dart';
import 'package:inhouse/model/communityList.dart';
import 'package:inhouse/service/api/getCommunityListService.dart';
import 'package:inhouse/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("========ExplorePage build========");
    return RefreshIndicator(
      displacement: Const.refreshIndicatorDisplacement,
      onRefresh: () async {
        await context.read<GetCommunityListService>().call("Explore");
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverAppBarExplore(),
          SliverList(
            // itemExtent: 153.0,
            delegate: CommunityCardList(
              context.select((CommunityList communityList) => communityList),
            ),
          ),
        ],
      ),
    );
  }
}
