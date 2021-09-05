import 'package:flutter/material.dart';

class NotificationNumberBadge extends StatelessWidget {
  const NotificationNumberBadge({Key key, @required this.value})
      : super(key: key);
  final int value;
  final Color color = Colors.red;
  final double size = 40;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.brightness_1,
          color: color,
          size: size,
        ),
        Text(
          value > 100 ? "99+" : value.toString(),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
