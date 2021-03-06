import 'package:inhouse/component/event/browse/oneCard/eventCard.dart';
import 'package:inhouse/util/util.dart';
import 'package:flutter/material.dart';

class EventCardRow extends StatelessWidget {
  final List row;
  EventCardRow({this.row});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.0),
      height: MediaQuery.of(context).size.width *
          Const.eventCardWidthSizePercentage,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return EventCardContainer(content: row[index]);
        },
        itemCount: row.length,
      ),
    );
  }
}
