// import 'dart:core';

import 'package:Inhouse/util/theme.dart';
import 'package:flutter/material.dart';

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
