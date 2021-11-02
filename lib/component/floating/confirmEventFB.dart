import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// create new event floating button
class ConfirmEventFB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: Text('確認'),
      onPressed: () => {},
      icon: Icon(Icons.remove_red_eye_outlined),
    );
  }
}
