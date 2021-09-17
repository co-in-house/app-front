import 'package:flutter/material.dart';
import 'dart:math' as math;

class CommunityBadgeContainer extends StatelessWidget {
  const CommunityBadgeContainer(
      {Key key, @required this.rankIndex, @required this.height})
      : super(key: key);

  final int rankIndex;
  final double height;
  @override
  Widget build(BuildContext context) {
    Widget _child = Text("$rankIndex");
    if (this.rankIndex == 1) {
      _child = Material(
        shape: CircleBorder(),
        elevation: 10.0,
        child: Container(
          alignment: Alignment.center,
          height: this.height * 0.15,
          width: this.height * 0.15,
          child: Text(
            "1",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                    offset: Offset(0.0, 0.2),
                    blurRadius: 10.0,
                    color: Colors.black)
              ],
            ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: SweepGradient(
              center: FractionalOffset.center,
              startAngle: 0.0,
              endAngle: math.pi * 2,
              colors: <Color>[
                Color(0xFFF5D100),
                Color(0x44F5D100),
                Color(0xFFF5D100),
                Color(0x44F5D100),
                Color(0xFFF5D100),
                Color(0x44F5D100),
                Color(0xFFF5D100),
                Color(0x44F5D100),
                Color(0xFFF5D100),
              ],
              stops: <double>[
                0.0,
                0.125,
                0.25,
                0.375,
                0.5,
                0.675,
                0.75,
                0.875,
                1.0
              ],
            ),
          ),
        ),
      );
    } else if (this.rankIndex == 2) {
      _child = getGradientBadge("2", Color(0xFFBDC3C9), Color(0x44BDC3C9));
    } else if (this.rankIndex == 3) {
      _child = getGradientBadge("3", Color(0xFFC47022), Color(0x44C47022));
    } else if (this.rankIndex == 4) {
      _child = getGradientBadge("4", Colors.blue[100], Colors.blue[100]);
    } else {
      _child = getGradientBadge("5", Colors.grey, Colors.grey);
    }
    return Container(child: _child);
  }

  Widget getGradientBadge(String label, Color _color1, Color _color2) {
    return Material(
      shape: CircleBorder(),
      elevation: 10.0,
      child: Container(
        alignment: Alignment.center,
        height: this.height * 0.15,
        width: this.height * 0.15,
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                  offset: Offset(0.0, 0.2),
                  blurRadius: 10.0,
                  color: Colors.black)
            ],
          ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: SweepGradient(
            center: FractionalOffset.center,
            startAngle: 0.0,
            endAngle: math.pi * 2,
            colors: <Color>[
              _color1,
              _color2,
              _color1,
              _color2,
              _color1,
              _color2,
              _color1,
              _color1,
              _color2,
            ],
            stops: <double>[
              0.0,
              0.125,
              0.25,
              0.375,
              0.5,
              0.675,
              0.75,
              0.875,
              1.0
            ],
          ),
        ),
      ),
    );
  }
}
