import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag({this.label}) : super();
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      margin: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
      child: Text(
        "#" + label,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(color: Colors.white, fontSize: 14.0),
        strutStyle: StrutStyle(
          fontSize: 14.0,
          height: 1.4,
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}
