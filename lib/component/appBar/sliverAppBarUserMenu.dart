// SliverAppBar for Explore
import 'package:inhouse/util/theme.dart';
import 'package:flutter/material.dart';

class SliverAppBarUserMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        "プロフィール",
        style: TextStyle(color: Colors.black),
      ),
      elevation: 0,
      floating: false,
      pinned: true,
      snap: false,
      // leading: Icon(Icons.ac_unit),
      actions: [
        Container(
          child: ElevatedButton(
            onPressed: () {
              print("edit profile");
            },
            child: Icon(Icons.edit, color: Colors.black),
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              shape: CircleBorder(),
              primary: inhouseThemeColor.backgroundColor,
              onPrimary: Colors.green,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
        ),
      ],
    );
  }
}
