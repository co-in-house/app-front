import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';

class AttendeeIconContainer extends StatelessWidget {
  const AttendeeIconContainer({
    Key key,
    @required this.size,
    @required this.url,
  }) : super(key: key);
  final String url;
  final double size;
  final double _horizontalMargin = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      alignment: Alignment.center,
      // margin: EdgeInsets.symmetric(horizontal: _horizontalMargin, vertical: 0),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.green,
        image: DecorationImage(
          image: NetworkImage(this.url),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        border: GradientBorder.uniform(
            width: 3.0,
            gradient: LinearGradient(
              colors: <Color>[
                Colors.yellow.shade600,
                Colors.orange,
                Colors.red
              ],
            )),
      ),
    );
  }
}
