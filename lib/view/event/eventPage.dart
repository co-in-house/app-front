import 'package:Inhouse/component/appBar/sliverAppBarEvent.dart';
import 'package:Inhouse/component/event/browse/eventCardRowList.dart';
import 'package:Inhouse/model/event/eventList.dart';
import 'package:Inhouse/service/api/event/getEventListService.dart';
import 'package:Inhouse/util/theme.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class EventPage extends StatelessWidget {
  final TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
        displacement: Const.refreshIndicatorDisplacement,
        onRefresh: () async {
          await context.read<GetEventListService>().call();
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            SliverAppBarEvent(searchTextController: this.searchTextController),
            SameMonthEventContainer(
                label: "November 2021",
                eventList: context.select((EventList eventList) => eventList)),
            // SameMonthEventContainer(
            //     label: "October 2021",
            //     eventList: context.select((EventList eventList) => eventList)),
          ],
        ),
      ),
    );
  }
}

class SameMonthEventContainer extends StatelessWidget {
  const SameMonthEventContainer(
      {Key key, @required this.eventList, @required this.label})
      : super(key: key);
  final EventList eventList;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        height: kToolbarHeight + MediaQuery.of(context).padding.top, // 60.0 ,
        color: inhouseThemeColor.backgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.bottomLeft,
        child: Text(
          this.label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      sliver: SliverList(
        delegate: EventCardRowList(this.eventList),
      ),
    );
  }
}
