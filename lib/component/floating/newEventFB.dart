import 'package:Inhouse/view/event/eventCreatePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// create new event floating button
class NewEventFB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return FloatingActionButton.extended(
    //   onPressed: () => print("pressed floatingActionButton"),
    //   icon: Icon(Icons.event),
    //   label: Text("Create New Event!"),
    // );
    return FloatingActionButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventCreatePage(),
            fullscreenDialog: true,
          ),
        ),
      },
      child: Icon(Icons.add),
    );
  }
}
