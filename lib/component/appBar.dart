import 'dart:core';
import 'dart:math';

import 'package:Inhouse/model/lounge/roomState.dart';
import 'package:Inhouse/service/user/userService.dart';
import 'package:Inhouse/util/theme.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:provider/provider.dart';

// SliverAppBar for Sample
class SliverAppBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Inhouse'),
      // backgroundColor: inhouseThemeColor.backgroundColor,
      backgroundColor: Colors.transparent,
      textTheme: TextTheme(
        headline6: TextStyle(
          // color: inhouseThemeColor.primaryColor,
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      iconTheme: IconThemeData(
        // color: Theme.of(context).primaryColor,
        color: Colors.white,
      ),
      floating: true,
      pinned: true,
      snap: true,
    );
  }
}

// SliverAppBar for Home
class SliverAppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Inhouse'),
      // automaticallyImplyLeading: false,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: inhouseThemeColor.primaryColor,
          fontSize: 20,
        ),
      ),
      iconTheme: IconThemeData(
        color: Theme.of(context).primaryColor,
      ),
      floating: true,
      pinned: true,
      snap: false,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 0),
          margin: EdgeInsets.symmetric(vertical: 4),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(
                color: Colors.grey,
                width: 0,
              ),
            ),
            elevation: 20.0,
            shadowColor: Colors.black,
            color: Colors.white,
            child: InkWell(
              onTap: () {
                print("InkWell");
                context.read<UserService>().logout();
              },
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'ログアウト機能',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      'テスト',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// SliverAppBar for Search
class SliverAppBarSearch extends StatelessWidget {
  SliverAppBarSearch({this.searchTextController});
  final TextEditingController searchTextController;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      pinned: true,
      snap: false,
      expandedHeight: MediaQuery.of(context).size.width * 0.8, //正方形
      title: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ElevatedButton.icon(
          icon: Icon(Icons.search),
          label: Text(
            '居場所を探す',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          style: ElevatedButton.styleFrom(
            animationDuration: Duration(seconds: 10),
            primary: Colors.white,
            onPrimary: Colors.green,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {
            print("onPressed");
          },
        ),
      ),

      flexibleSpace: Stack(
        children: [
          Positioned(
              child: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Image(
                  fit: BoxFit.fitWidth,
                  image: AssetImage("images/wp.jpg"),
                ),
              ),
              top: 0,
              left: 0,
              right: 0,
              bottom: 0),
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    "自然を近くに感じる旅",
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Arial",
                      height: 1.2,
                      shadows: [
                        Shadow(
                            color: Colors.white,
                            offset: Offset.fromDirection(0, 0),
                            blurRadius: 0.0)
                      ],
                      fontSize: 46,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 1),
                  child: Text(
                    "inhouseが選ぶオススメ",
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Arial",
                      height: 1.2,
                      shadows: [
                        Shadow(
                            color: Colors.white,
                            offset: Offset.fromDirection(0, 0),
                            blurRadius: 0.0)
                      ],
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 0),
                  child: ElevatedButton(
                    child: Text(
                      "アイディアを見る",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      animationDuration: Duration(seconds: 10),
                      primary: Colors.black,
                      onPrimary: Colors.green,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            top: MediaQuery.of(context).size.width * 0.3,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
          ),
        ],
      ),
    );
  }
}

// SliverAppBar for Lounge
class SliverAppBarLounge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: false,
      pinned: false,
      snap: false,
    );
  }
}

// SliverAppBar for Chat
class SliverAppBarChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: CustomColor.linearGradient(
              context.select((RoomState roomState) => roomState).index),
        ),
      ),
      title: Text('チャットルーム'),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      floating: true,
      pinned: true,
      snap: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_circle_down),
        onPressed: () =>
            Const.miniplayerController.animateToHeight(state: PanelState.MIN),
      ),
    );
  }
}

// SliverAppBar for Cut
class SliverAppBarCut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: false,
      pinned: false,
      snap: false,
    );
  }
}

// SliverAppBar for Album
class SliverAppBarAlbum extends StatelessWidget {
  SliverAppBarAlbum({
    @required this.communityName,
    @required this.albumName,
  }) : super();
  final String communityName;
  final String albumName;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: false,
      pinned: true,
      delegate: _SliverAppBarAlbumDelegate(
        toolBarHeight: kToolbarHeight + MediaQuery.of(context).padding.top,
        communityName: this.communityName,
        albumName: this.albumName,
      ),
    );
  }
}

class _SliverAppBarAlbumDelegate extends SliverPersistentHeaderDelegate {
  double toolBarHeight;
  String communityName;
  String albumName;

  _SliverAppBarAlbumDelegate({
    this.toolBarHeight,
    this.communityName,
    this.albumName,
  });

  @override
  Widget build(_, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.green[50], // 背景色
            height: minExtent,
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(_).padding.left,
                right: MediaQuery.of(_).padding.right,
                top: MediaQuery.of(_).padding.top,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(_);
                      },
                      child: Icon(Icons.arrow_back, color: Colors.black),
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        shape: CircleBorder(),
                        primary: Colors.white,
                        onPrimary: Colors.green,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          this.communityName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        Text(
                          this.albumName,
                          style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        print("album option");
                      },
                      child: Icon(Icons.more_horiz, color: Colors.black),
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        shape: CircleBorder(),
                        primary: Colors.white,
                        onPrimary: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => toolBarHeight; // minで固定

  @override
  double get minExtent => toolBarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

// SliverAppBar for Community Hero Image
class SliverAppBarCommunityImage extends StatelessWidget {
  SliverAppBarCommunityImage({
    @required this.id,
    @required this.imagePath,
    @required this.communityName,
    @required this.cheer,
    this.genreId,
  }) : super();
  final int id;
  final String imagePath;
  final String communityName;
  final int cheer;
  final int genreId;
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _SliverAppBarCommunityImage(
        toolBarHeight: kToolbarHeight,
        openHeight: MediaQuery.of(context).size.width,
        closedHeight: MediaQuery.of(context).padding.top,
        id: this.id,
        imagePath: this.imagePath,
        communityName: this.communityName,
        cheer: this.cheer,
        genreId: this.genreId,
      ),
      floating: false,
      pinned: true,
    );
  }
}

class _SliverAppBarCommunityImage extends SliverPersistentHeaderDelegate {
  double toolBarHeight;
  double closedHeight;
  double openHeight;
  int id;
  String imagePath;
  String communityName;
  int cheer;
  int genreId;

  _SliverAppBarCommunityImage({
    this.toolBarHeight,
    this.closedHeight,
    this.openHeight,
    this.id,
    this.imagePath,
    this.communityName,
    this.cheer,
    this.genreId,
  });

  @override
  Widget build(_, double shrinkOffset, bool overlapsContent) {
    var shrinkPercentage =
        min(1, shrinkOffset / (maxExtent - minExtent)).toDouble();

    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          children: [
            Flexible(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    // color: inhouseThemeColor.appBarTheme.backgroundColor, //背景色
                    color: Colors.green[50], //背景色
                  ),
                  Opacity(
                    opacity: 1 - shrinkPercentage,
                    child: SizedBox(
                      height: MediaQuery.of(_).size.width,
                      width: MediaQuery.of(_).size.width,
                      child: Hero(
                        tag: '_heroNo' +
                            this.id.toString() +
                            this.genreId.toString(),
                        child: Image(
                          fit: BoxFit.cover,
                          alignment: FractionalOffset.topCenter,
                          image: Check.isUrlPath(this.imagePath)
                              ? NetworkImage(this.imagePath)
                              : AssetImage(this.imagePath),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    height: minExtent,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(_).padding.left,
                        right: MediaQuery.of(_).padding.right,
                        top: MediaQuery.of(_).padding.top,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(_);
                              },
                              child:
                                  Icon(Icons.arrow_back, color: Colors.black),
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                shape: CircleBorder(),
                                primary: Colors.white,
                                onPrimary: Colors.green,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Opacity(
                              opacity: shrinkPercentage,
                              child: Text(
                                this.communityName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                print("edit community!!!");
                              },
                              child: Icon(Icons.edit, color: Colors.black),
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                shape: CircleBorder(),
                                primary: Colors.white,
                                onPrimary: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: max(1 - shrinkPercentage * 4, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 100),
                        Text(
                          this.communityName,
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'Subtitle',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => openHeight;

  @override
  double get minExtent => toolBarHeight + closedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

// CustomAppBar
class CustomAppBar {
// for create new community
  static AppBar newCommunity(BuildContext context) {
    return AppBar(
      title: Text("コミュニティを作成"),
      backgroundColor: Colors.white,
      shadowColor: Color.fromRGBO(0, 0, 0, 0),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: inhouseThemeColor.primaryColor,
          fontSize: 20,
        ),
      ),
      iconTheme: IconThemeData(
        color: inhouseThemeColor.primaryColor,
      ),
    );
  }

// for create new community confirm
  static AppBar newCommunityConfirm(BuildContext context) {
    return AppBar(
      title: Text("コミュニティを作成"),
      backgroundColor: Colors.transparent,
      shadowColor: Color.fromRGBO(0, 0, 0, 2),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    );
  }

  // for create new community detail
  static AppBar newCommunityDetail(BuildContext context) {
    return AppBar(
      title: Text('コミュニティ詳細'),
      backgroundColor: Colors.transparent,
      shadowColor: Color.fromRGBO(0, 0, 0, 2),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    );
  }
}
