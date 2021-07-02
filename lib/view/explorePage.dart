import 'package:Inhouse/component/appBar.dart';
import 'package:Inhouse/component/search/communityCardList.dart';
import 'package:Inhouse/model/communityList.dart';
import 'package:Inhouse/service/api/getCommunityListService.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExplorePage extends StatelessWidget {
  final TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("========ExplorePage build========");
    return RefreshIndicator(
      displacement: Const.refreshIndicatorDisplacement,
      onRefresh: () async {
        print("searchTextController:" + this.searchTextController.text);
        await context
            .read<GetCommunityListService>()
            .call(this.searchTextController.text);
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverAppBarSearch(searchTextController: this.searchTextController),
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
