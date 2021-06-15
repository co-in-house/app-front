import 'package:Inhouse/component/event/eventCardRowList.dart';
import 'package:Inhouse/model/eventList.dart';
import 'package:Inhouse/service/api/getEventListService.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Inhouse/component/appBar.dart';
import 'package:provider/provider.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[50],
      child: RefreshIndicator(
        displacement: Const.refreshIndicatorDisplacement,
        onRefresh: () async {
          await context.read<GetEventListService>().call();
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            SliverAppBarSample(),
            SliverFixedExtentList(
              itemExtent: MediaQuery.of(context).size.height * 0.23,
              delegate: EventCardRowList(
                context.select((EventList eventList) => eventList),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
