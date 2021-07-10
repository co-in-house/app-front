import 'package:Inhouse/service/changePage.dart';
import 'package:Inhouse/util/theme.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      items: <Widget>[
        Icon(Icons.home, size: 30),
        Icon(Icons.explore, size: 30),
        Icon(Icons.apps, size: 30),
        Icon(Icons.event_available, size: 30),
        Icon(Icons.message_rounded, size: 30),
      ],
      color: Colors.white,
      buttonBackgroundColor: Colors.white,
      backgroundColor: inhouseThemeColor.bannerTheme.backgroundColor,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 600),
      onTap: (index) {
        context.read<ChangePage>().set(index);
      },
    );
  }
}
