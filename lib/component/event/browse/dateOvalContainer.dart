import 'package:inhouse/util/theme.dart';
import 'package:flutter/material.dart';

class EventDateOvalContainer extends StatelessWidget {
  EventDateOvalContainer({Key key, this.size, this.date, this.dayOfWeek})
      : super(key: key);
  final String date;
  final String dayOfWeek;
  final Color color = Colors.green[400];
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.brightness_1,
            color: color,
            size: size,
          ),
          Container(
            child: Column(
              children: [
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: "Arial",
                  ),
                ),
                Text(
                  dayOfWeek,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
