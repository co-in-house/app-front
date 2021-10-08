import 'package:flutter/material.dart';

class InhouseAppBar {
  static Widget build(BuildContext context) {
    MediaQueryData screenInfo = MediaQuery.of(context);
    return PreferredSize(
      preferredSize: Size(screenInfo.size.width, kToolbarHeight),
      child: Container(
        height: kToolbarHeight + screenInfo.padding.top,
        color: Colors.transparent,
        padding: EdgeInsets.only(top: screenInfo.padding.top),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: kToolbarHeight * 0.8,
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
            Container(
              height: kToolbarHeight * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  print("pressed edit event");
                },
                child: Icon(Icons.edit, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  shape: CircleBorder(),
                  primary: Colors.green[400],
                  onPrimary: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
