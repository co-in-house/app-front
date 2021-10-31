import 'package:inhouse/view/event/eventEditPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// create new event floating button
class NewEventFB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventEdigPage(),
            fullscreenDialog: true,
          ),
        ),
      },
      child: Icon(Icons.add),
    );
  }
}
