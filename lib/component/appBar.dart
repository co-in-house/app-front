import 'package:Inhouse/service/api/getCommunityListService.dart';
import 'package:Inhouse/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// SliverAppBar for Sample
class SliverAppBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Inhouse'),
      backgroundColor: inhouseThemeColor.backgroundColor,
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
      backgroundColor: inhouseThemeColor.backgroundColor,
      iconTheme: IconThemeData(
        color: inhouseThemeColor.primaryColor,
      ),
      floating: true,
      pinned: true,
      snap: true,
    );
  }
}

// CustomAppBar for create Community
class CustomAppBarCommunity {
  // for community name
  static AppBar name(BuildContext context) {
    return AppBar(
      title: Text("コミュニティ名"),
      backgroundColor: inhouseThemeColor.backgroundColor,
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

  // for community tag
  static AppBar tag(BuildContext context) {
    return AppBar(
      title: Text("コミュニティタグ"),
      backgroundColor: inhouseThemeColor.backgroundColor,
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

  // for community content
  static AppBar content(BuildContext context) {
    return AppBar(
      title: Text("活動内容"),
      backgroundColor: inhouseThemeColor.backgroundColor,
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

  // for community location
  static AppBar location(BuildContext context) {
    return AppBar(
      title: Text("主な活動場所"),
      backgroundColor: inhouseThemeColor.backgroundColor,
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

// for community requirement
  static AppBar requirement(BuildContext context) {
    return AppBar(
      title: Text("入会条件"),
      backgroundColor: inhouseThemeColor.backgroundColor,
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

// for community image
  static AppBar image(BuildContext context) {
    return AppBar(
      title: Text("画像登録"),
      backgroundColor: inhouseThemeColor.backgroundColor,
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

// for community note
  static AppBar note(BuildContext context) {
    return AppBar(
      title: Text("備考情報"),
      backgroundColor: inhouseThemeColor.backgroundColor,
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

// for community sampleCard
  static AppBar sample(BuildContext context) {
    return AppBar(
      title: Text("コミュニティを作成"),
      backgroundColor: inhouseThemeColor.backgroundColor,
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
}
