// import 'dart:html';

import 'package:inhouse/component/appBar/sliverAppBarEvent.dart';
import 'package:inhouse/component/event/browse/eventCardRowList.dart';
import 'package:inhouse/model/event/eventList.dart';
import 'package:inhouse/service/api/event/getEventListService.dart';
import 'package:inhouse/util/format.dart';
import 'package:inhouse/util/theme.dart';
import 'package:inhouse/util/util.dart';
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
          slivers: true
              // ||
              //         eventMatrix.isLoading &&
              //             (eventMatrix.contents == null ||
              //                 eventMatrix.contents.length == 0)
              ? [
                  SliverAppBarEvent(),
                  SliverToBoxAdapter(
                    child: _SorryContainer(),
                  ),
                ]
              : _getSlivers(eventMatrix: eventMatrix),
        ),
      ),
    );
  }

  List<Widget> _getSlivers({@required EventMatrix eventMatrix}) {
    List<Widget> _slivers = [SliverAppBarEvent()];

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
        // height: kToolbarHeight + MediaQuery.of(context).padding.top, // 60.0 ,
        color: inhouseThemeColor.backgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        alignment: Alignment.bottomLeft,
        child: Text(
          this.label,
          style: const TextStyle(
            color: const Color(0xFF707070),
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

class _SorryContainer extends StatelessWidget {
  final TextStyle _mainStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );
  final TextStyle _subStyle = TextStyle(
    color: Color(0xFF707070),
    fontWeight: FontWeight.normal,
    // fontSize: 24,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '参加できるイベントが',
            textAlign: TextAlign.center,
            style: _mainStyle,
          ),
          Text(
            'ありません！',
            textAlign: TextAlign.center,
            style: _mainStyle,
          ),
          Text('', style: _subStyle),
          Text(
            'コミュニティに参加していなければ\n虫眼鏡アイコンをタップして\nコミュニティを探してみましょう！',
            textAlign: TextAlign.center,
            style: _subStyle,
          ),
          Text(''),
          Text('コミュニティに所属しているのであれば',
              textAlign: TextAlign.center, style: _subStyle),
          Text('+ボタンをタップして', textAlign: TextAlign.center, style: _subStyle),
          Text('イベントを作成してみましょう', textAlign: TextAlign.center, style: _subStyle),
        ],
      ),
    );
  }
}
