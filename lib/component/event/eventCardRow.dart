import 'package:Inhouse/component/event/eventCard.dart';
import 'package:flutter/material.dart';

class EventCardRow extends StatelessWidget {
  final List row;
  EventCardRow({this.row});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.0),
      // height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return EventCard(content: row[index]);
        },
        itemCount: row.length,
      ),
    );
  }
}
