import 'package:Inhouse/component/timeline/postCardList.dart';
import 'package:Inhouse/model/postList.dart';
import 'package:Inhouse/service/api/getPostListService.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Inhouse/component/appBar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("========HomePage build========");
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: AssetImage('images/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),

      // color: Colors.white,
      child: RefreshIndicator(
        displacement: Const.refreshIndicatorDisplacement,
        onRefresh: () async {
          await context.read<GetPostListService>().call();
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            SliverAppBarSample(),
            SliverList(
              // itemExtent: 108.0,
              delegate: PostCardList(
                  context, context.select((PostList postList) => postList)),
            ),
          ],
        ),
      ),
    );
  }
}
