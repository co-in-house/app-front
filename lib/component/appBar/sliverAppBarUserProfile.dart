// SliverAppBar for Explore
import 'package:flutter/material.dart';

class SliverAppBarUserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      title: Text(
        "プロフィール",
        style: TextStyle(color: Colors.black),
      ),
      elevation: 0,
      floating: false,
      pinned: true,
      snap: false,
    );
  }
}
