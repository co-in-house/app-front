import 'package:Inhouse/component/event/eventCardRowList.dart';
import 'package:Inhouse/model/eventList.dart';
import 'package:Inhouse/service/api/getEventListService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Inhouse/component/appBar.dart';
import 'package:provider/provider.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        SliverAppBarSample(),
        CupertinoSliverRefreshControl(
          onRefresh: () async {
            await context.read<GetEventListService>().call();
          },
        ),
        SliverFixedExtentList(
          itemExtent: 200.0,
          delegate: EventCardRowList(
            context.select((EventList eventList) => eventList),
          ),
        ),
      ],
    );
  }
}
