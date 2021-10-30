import 'package:flutter/material.dart';

class JoinFloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => print("pressed floatingActionButton"),
      icon: Icon(Icons.event),
      label: Text("Join This Event!"),
    );
  }
}
