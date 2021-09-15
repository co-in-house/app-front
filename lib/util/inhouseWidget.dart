import 'package:flutter/material.dart';

class InhouseWidget {
  static Widget toggleContainer() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: 80,
      height: 6,
      decoration: BoxDecoration(
        color: Color(0xFFe0e0e0),
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }

  static Widget dividerContainer() {
    return Container(
      child: Divider(),
    );
  }
}
