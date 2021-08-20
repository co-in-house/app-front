import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({this.label}) : super();
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      child: Text(
        label,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
        ),
        strutStyle: StrutStyle(
          fontSize: 14.0,
          height: 1.4,
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}
