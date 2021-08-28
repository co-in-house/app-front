import 'package:flutter/material.dart';

class CommunityFilterButton extends StatelessWidget {
  const CommunityFilterButton({
    Key key,
    @required this.id,
    @required this.label,
  }) : super(key: key);
  final int id;
  final String label;

  final double _height = 34;
  final double _radiusCircular = 15;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      width: MediaQuery.of(context).size.width * 0.4,
      height: _height,
      child: ElevatedButton(
        onPressed: () {
          print("onPressed! : $id");
        },
        style: ElevatedButton.styleFrom(
            elevation: 3.0,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_radiusCircular),
            )),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
