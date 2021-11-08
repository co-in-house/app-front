import 'package:flutter/material.dart';

class JoinFloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: const Color(0xFF3A7CD6),
      onPressed: () => print("pressed floatingActionButton"),
      icon: Icon(Icons.event),
      label: Text("Join This Event!"),
    );
  }
}
