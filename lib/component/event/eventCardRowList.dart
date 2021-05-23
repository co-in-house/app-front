import 'package:Inhouse/component/event/eventCardRow.dart';
import 'package:Inhouse/model/eventList.dart';
import 'package:flutter/material.dart';

class EventCardRowList extends SliverChildListDelegate {
  EventCardRowList(EventList eventList)
      : super(_EventList.buildEventList(eventList));
}

class _EventList {
  static List<Widget> buildEventList(EventList eventList) {
    print(eventList);
    if (eventList.col == null || eventList.col.length == 0) {
      return [Text("No Content")];
    } else {
      List<Widget> list = [];
      for (int index = 0; index < eventList.col.length; index++) {
        list.add(EventCardRow(row: eventList.col[index]));
      }
      return list;
    }
  }
}
