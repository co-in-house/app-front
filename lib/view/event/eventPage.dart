import 'package:Inhouse/component/appBar/sliverAppBarEvent.dart';
import 'package:Inhouse/component/event/browse/eventCardRowList.dart';
import 'package:Inhouse/model/event/eventList.dart';
import 'package:Inhouse/service/api/event/getEventListService.dart';
import 'package:Inhouse/util/format.dart';
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
    EventMatrix eventMatrix =
        context.select((EventMatrix eventMatrix) => eventMatrix);
    return Container(
      child: RefreshIndicator(
        displacement: Const.refreshIndicatorDisplacement,
        onRefresh: () async {
          await context
              .read<GetEventListService>()
              .call(communityIdList: [1, 2, 3]);
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: eventMatrix.isLoading && eventMatrix.contents.length == 0
              ? [
                  SliverAppBarEvent(),
                  SliverToBoxAdapter(
                    child: Container(
                      child: Text("読み込み中"),
                    ),
                  ),
                ]
              : _getSlivers(eventMatrix: eventMatrix),
        ),
      ),
    );
  }

  List<Widget> _getSlivers({@required EventMatrix eventMatrix}) {
    List<Widget> _slivers = [SliverAppBarEvent()];

    if (eventMatrix.contents.length == 0) {
      _slivers.add(
        SliverToBoxAdapter(
          child: Container(
            child: Text("イベントを作成しよう！"),
          ),
        ),
      );
      return _slivers;
    }
    String tmpStart =
        TimestampUtil.getYearMonthOfTimeStamp(eventMatrix.contents[0][0].start);
    List<List<OneEvent>> _eventMatrix = [];
    for (int i = 0; i < eventMatrix.contents.length; i++) {
      if (tmpStart ==
          TimestampUtil.getYearMonthOfTimeStamp(
              eventMatrix.contents[i][0].start)) {
        _eventMatrix.add(eventMatrix.contents[i]);
      } else {
        _slivers.add(SameMonthEventContainer(
          eventMatrix: EventMatrix(contents: _eventMatrix),
          label: tmpStart,
        ));
        tmpStart = TimestampUtil.getYearMonthOfTimeStamp(
            eventMatrix.contents[i][0].start);
        _eventMatrix = [];
        _eventMatrix.add(eventMatrix.contents[i]);
      }
      // 終端処理
      if (eventMatrix.contents.length - 1 == i) {
        _slivers.add(SameMonthEventContainer(
          eventMatrix: EventMatrix(contents: _eventMatrix),
          label: tmpStart,
        ));
      }
    }
    return _slivers;
  }
}

class SameMonthEventContainer extends StatelessWidget {
  const SameMonthEventContainer(
      {Key key, @required this.eventMatrix, @required this.label})
      : super(key: key);
  final EventMatrix eventMatrix;
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
        delegate: EventCardMatrix(this.eventMatrix),
      ),
    );
  }
}
