// header用button
import 'package:inhouse/util/util.dart';
import 'package:flutter/material.dart';

class HeaderButtonEditEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Const.headerButtonContainerHeight,
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
    );
  }
}
