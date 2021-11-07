import 'package:inhouse/component/common/dateTimeFixedContainer.dart';
import 'package:inhouse/component/common/detailHeroImageContainer.dart';
import 'package:inhouse/component/event/edit/commSelectContainer.dart';
import 'package:inhouse/model/community/CommunityOverview.dart';
import 'package:inhouse/model/event/eventList.dart';
import 'package:inhouse/util/util.dart';
import 'package:flutter/material.dart';

class EventDetailDelegate extends SliverChildListDelegate {
  EventDetailDelegate(
    BuildContext context,
    OneEvent eventInfo,
    CommunityOverview selectedComm,
  ) : super(_EventDetailRowList.build(
          context,
          eventInfo,
          selectedComm,
        ));
  BuildContext context;
  OneEvent eventInfo;
  CommunityOverview selectedComm;
}

class _EventDetailRowList {
  static final Color _titleColor = Colors.black; // Color(0xFF64B06E);
  static final Color _descriptionFontColor = Colors.grey;

  static List<Widget> build(
    BuildContext context,
    OneEvent eventInfo,
    CommunityOverview selectedComm,
  ) {
    Size _screenSize = MediaQuery.of(context).size;
    final double _horizontalPadding =
        _screenSize.width * (1 - Const.containerWidthPercentage);
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
// start
    list.add(
      Container(
        margin: EdgeInsets.only(top: _screenSize.width * 0.05),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 30,
              child:
                  Icon(Icons.date_range_outlined, color: _descriptionFontColor),
              margin: EdgeInsets.only(right: 5),
            ),
            Flexible(
              child: DateTimeFixedContainer(
                label: "開始",
                descriptionFontColor: _descriptionFontColor,
                startStr: eventInfo.start,
                endStr: eventInfo.end,
                isStart: true,
              ),
            ),
          ],
        ),
      ),
    );
    // end
    list.add(
      Container(
        margin: EdgeInsets.only(top: _screenSize.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: Row(
          children: [
            Container(
              width: 30,
              margin: EdgeInsets.only(right: 5),
            ),
            Flexible(
              child: DateTimeFixedContainer(
                label: "終了",
                descriptionFontColor: _descriptionFontColor,
                startStr: eventInfo.start,
                endStr: eventInfo.end,
                isStart: false,
              ),
            ),
          ],
        ),
      ),
    );

    // location
    list.add(
      Container(
        margin: EdgeInsets.only(top: _screenSize.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 30,
              child: Icon(Icons.location_on_outlined,
                  color: _descriptionFontColor),
              margin: EdgeInsets.only(right: 5),
            ),
            Text(eventInfo.location,
                style: TextStyle(color: _descriptionFontColor)),
          ],
        ),
      ),
    );

    // selected community

    list.add(
      Container(
        margin: EdgeInsets.only(top: _screenSize.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: CommSelectContainer(
          canTap: false,
          fixedComm: selectedComm,
        ),
      ),
    );
    // description
    list.add(
      Container(
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        margin: EdgeInsets.symmetric(vertical: _verticalRowMargin),
        child: Text(
          eventInfo.description,
          style: TextStyle(
            color: _descriptionFontColor,
          ),
        ),
      ),
    );
    return list;
  }
}
