import 'dart:core';

import 'package:Inhouse/model/lounge/roomState.dart';
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
              },
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Room',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      '1',
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
      expandedHeight: MediaQuery.of(context).size.width, //正方形
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
                  fit: BoxFit.fitHeight,
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

// SliverAppBar for Community Hero Image
class SliverAppBarCommunityImage extends StatelessWidget {
  SliverAppBarCommunityImage(
      {@required this.imagePath,
      @required this.label,
      @required this.locationLabel})
      : super();
  final String imagePath;
  final String label;
  final String locationLabel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      stretch: true,
      floating: true,
      pinned: false,
      snap: false,
      expandedHeight: MediaQuery.of(context).size.width, //正方形

      flexibleSpace: Stack(
        children: [
          Positioned(
              child: Image(
                fit: BoxFit.cover,
                image: Check.isUrlPath(this.imagePath)
                    ? NetworkImage(this.imagePath)
                    : AssetImage(this.imagePath),
              ),
              top: 0,
              left: 0,
              right: 0,
              bottom: 0),
          Positioned(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // これで両端に寄せる
                children: <Widget>[
                  Text(
                    this.label,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    this.locationLabel,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 0.0,
                    blurRadius: 10.0,
                  ),
                ],
              ),
            ),
            bottom: 0,
            left: 0,
            right: 0,
          ),
        ],
      ),
    );
  }
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
