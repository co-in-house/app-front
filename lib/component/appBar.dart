import 'dart:core';

import 'package:Inhouse/service/api/getCommunityListService.dart';
import 'package:Inhouse/util/theme.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';
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
      // bottom: PreferredSize(
      //   preferredSize: const Size.fromHeight(50),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       TextField(
      //           decoration: new InputDecoration(
      //         suffixIcon:
      //             new Icon(Icons.search, color: Theme.of(context).primaryColor),
      //         hintText: "fixed object",
      //       ))
      //     ],
      //   ),
      // ),
    );
  }
}

// SliverAppBar for Home
class SliverAppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Inhouse'),
      // backgroundColor: inhouseThemeColor.backgroundColor,
      backgroundColor: Colors.transparent,
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
      pinned: false,
      snap: false,
      // bottom: PreferredSize(
      //   preferredSize: const Size.fromHeight(50),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       TextField(
      //           decoration: new InputDecoration(
      //         suffixIcon:
      //             new Icon(Icons.search, color: Theme.of(context).primaryColor),
      //         hintText: "fixed object",
      //       ))
      //     ],
      //   ),
      // ),
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
      title: TextField(
        controller: searchTextController,
        decoration: new InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(Icons.search, color: inhouseThemeColor.primaryColor),
            onPressed: () async {
              print("searchTextController:" + this.searchTextController.text);
              await context
                  .read<GetCommunityListService>()
                  .call(this.searchTextController.text);
            },
          ),
          hintText: "serach text",
        ),
      ),
      // backgroundColor: inhouseThemeColor.backgroundColor,
      iconTheme: IconThemeData(
        color: inhouseThemeColor.primaryColor,
      ),
      floating: true,
      pinned: true,
      snap: true,
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
      pinned: true,
      snap: true,
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
