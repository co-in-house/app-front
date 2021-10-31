import 'package:inhouse/util/util.dart';
import 'package:flutter/material.dart';

class InhouseAppBar {
  static Widget build(BuildContext context, List<Widget> actions) {
    MediaQueryData screenInfo = MediaQuery.of(context);

    List<Widget> children = [
      SizedBox(
        height: Const.headerButtonContainerHeight,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            shape: CircleBorder(),
            primary: Colors.green[400],
            onPrimary: Colors.green,
          ),
        ),
      ),
    ];

    if (actions != null && actions.length > 0) {
      children.addAll(actions);
    }

    return PreferredSize(
      preferredSize: Size(screenInfo.size.width, kToolbarHeight),
      child: Container(
        height: kToolbarHeight + screenInfo.padding.top,
        color: Colors.transparent,
        padding: EdgeInsets.only(top: screenInfo.padding.top),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
