import 'package:Inhouse/component/appBar/sliverAppBarExplore.dart';
import 'package:Inhouse/component/explore/communityCardList.dart';
import 'package:Inhouse/model/communityList.dart';
import 'package:Inhouse/service/api/getCommunityListService.dart';
import 'package:Inhouse/util/util.dart';
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
