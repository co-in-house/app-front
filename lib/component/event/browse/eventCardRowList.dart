import 'package:inhouse/component/event/browse/eventCardRow.dart';
import 'package:inhouse/model/event/eventList.dart';
import 'package:flutter/material.dart';

class EventCardMatrix extends SliverChildListDelegate {
  EventCardMatrix(EventMatrix eventMatrix)
      : super(_EventList.buildEventList(eventMatrix));
}

class _EventList {
  static List<Widget> buildEventList(EventMatrix eventMatrix) {
    print("buildEventList");
    if (eventMatrix.contents == null || eventMatrix.contents.length == 0) {
      return [Text("No Content")];
    } else {
      List<Widget> list = [];
      for (int index = 0; index < eventMatrix.contents.length; index++) {
        list.add(EventCardRow(row: eventMatrix.contents[index]));
      }
      return list;
    }
  }
}
