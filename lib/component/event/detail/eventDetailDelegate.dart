import 'package:Inhouse/component/common/detailHeroImageContainer.dart';
import 'package:Inhouse/model/event/eventList.dart';
import 'package:flutter/material.dart';

class EventDetailDelegate extends SliverChildListDelegate {
  EventDetailDelegate(BuildContext context, OneCardOnEventList eventInfo)
      : super(_EventDetailRowList.build(context, eventInfo));
  BuildContext context;
  OneCardOnEventList eventInfo;
}

class _EventDetailRowList {
  static List<Widget> build(
      BuildContext context, OneCardOnEventList eventInfo) {
    List<Widget> list = [];
    list.add(DetailHeroImageContainer(
      imgUrl: eventInfo.img,
      heroTag: '_eventHeroNo' + eventInfo.id.toString(),
    ));
    for (int i = 0; i < 200; i++) {
      list.add(Text("hogehoge party! $i"));
    }
    return list;
  }
}
