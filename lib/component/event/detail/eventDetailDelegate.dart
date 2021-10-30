import 'package:Inhouse/component/common/detailHeroImageContainer.dart';
import 'package:Inhouse/component/event/detail/eventDetailBasicInfoContainer.dart';
import 'package:Inhouse/mock/mock.dart';
import 'package:Inhouse/model/event/eventList.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';

class EventDetailDelegate extends SliverChildListDelegate {
  EventDetailDelegate(
    BuildContext context,
    OneEvent eventInfo,
  ) : super(_EventDetailRowList.build(context, eventInfo));
  BuildContext context;
  OneEvent eventInfo;
}

class _EventDetailRowList {
  static final Color _titleColor = Colors.black; // Color(0xFF64B06E);
  static final Color _descriptionFontColor = Colors.grey;
  static List<Widget> build(BuildContext context, OneEvent eventInfo) {
    final double _horizontalPadding = MediaQuery.of(context).size.width *
        (1 - Const.containerWidthPercentage);
    final double _verticalRowMargin = _horizontalPadding / 3;

    List<Widget> list = [];
    list.add(
      DetailHeroImageContainer(
        imgUrl: eventInfo.thumbnailImg,
        heroTag: '_eventHeroNo' + eventInfo.eventId.toString(),
      ),
    );
    // title
    list.add(
      Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: Text(
          eventInfo.title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: _titleColor,
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
    // description
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
