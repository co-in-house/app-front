import 'package:Inhouse/component/timeline/postCardList.dart';
import 'package:Inhouse/model/postList.dart';
import 'package:Inhouse/service/api/getPostListService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Inhouse/component/appBar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        SliverAppBarHome(),
        CupertinoSliverRefreshControl(
          onRefresh: () async {
            await context.read<GetPostListService>().call();
          },
        ),
        SliverFixedExtentList(
          itemExtent: 200.0,
          delegate: PostCardRowList(
            context.select((PostList eventList) => eventList),
          ),
        ),
      ],
    );
  }
}
