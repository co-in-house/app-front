import 'package:Inhouse/component/common/detailHeroImageContainer.dart';
import 'package:Inhouse/component/event/detail/eventDetailBasicInfoContainer.dart';
import 'package:Inhouse/component/icon/iconOverlayContainer.dart';
import 'package:Inhouse/mock/mock.dart';
import 'package:Inhouse/model/event/eventList.dart';
import 'package:Inhouse/util/util.dart';
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
    final double _horizontalPadding = MediaQuery.of(context).size.width *
        (1 - Const.containerWidthPercentage) /
        2;
    final double _verticalRowMargin = _horizontalPadding / 3;
    final Color _descriptionFontColor = Colors.grey;
    List<Widget> list = [];
    list.add(
      DetailHeroImageContainer(
        imgUrl: eventInfo.img,
        heroTag: '_eventHeroNo' + eventInfo.id.toString(),
      ),
    );
    // title
    list.add(
      Container(
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: Text(
          eventInfo.eventTitle,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    // basic info container
    list.add(
      EventDetailBasicInfoContainer(
        height: 35,
        horizontalPadding: _horizontalPadding,
        verticalRowMargin: _verticalRowMargin,
        descriptionFontColor: _descriptionFontColor,
      ),
    );

    list.add(
      Container(
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        margin: EdgeInsets.symmetric(vertical: _verticalRowMargin),
        child: Text(
          Mock.longDescription,
          style: TextStyle(
            color: _descriptionFontColor,
          ),
        ),
      ),
    );
    return list;
  }
}
