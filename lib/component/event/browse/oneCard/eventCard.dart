import 'dart:ui';

import 'package:inhouse/component/event/browse/dateOvalContainer.dart';
import 'package:inhouse/component/event/browse/oneCard/eventCardBottomContainer.dart';
import 'package:inhouse/model/community/JoinedCommunity.dart';
import 'package:inhouse/model/event/attendee/attendees.dart';
import 'package:inhouse/model/event/eventList.dart';
import 'package:inhouse/service/api/event/getAttendeesService.dart';
import 'package:inhouse/util/dataQuery.dart';
import 'package:inhouse/util/format.dart';
import 'package:inhouse/util/util.dart';
import 'package:inhouse/view/event/eventDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

// event 1 card container
class EventCardContainer extends HookWidget {
  EventCardContainer({this.content});
  final OneEvent content;
  final double cardMarginVertical = 10.0;
  final double cardMarginHorizontal = 10.0;

  @override
  Widget build(BuildContext context) {
    final isCardPushed = useState<bool>(false);
    double cardSize =
        MediaQuery.of(context).size.width * Const.eventCardWidthSizePercentage;
    double bottomContainerSize = cardSize * 0.25;

    return Container(
      width: cardSize,
      height: cardSize,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 240),
        padding: EdgeInsets.all(isCardPushed.value ? 24 : 0),
        child: Card(
          margin: EdgeInsets.symmetric(
              vertical: cardMarginVertical, horizontal: cardMarginHorizontal),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Const.borderRadius),
          ),
          elevation: 3.0,
          child: GestureDetector(
            onTapDown: (TapDownDetails downDetails) {
              isCardPushed.value = true;
              print("isCardPushed do : " + isCardPushed.toString());
            },
            onTapCancel: () {
              isCardPushed.value = false;
              print("isCardPushed ca : " + isCardPushed.toString());
            },
            onTap: () => {
              isCardPushed.value = false,
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiProvider(
                    providers: [
                      StateNotifierProvider<GetAttendeesService, Attendees>(
                        create: (context) => GetAttendeesService(),
                      ),
                    ],
                    child: EventDetailPage(eventInfo: this.content),
                  ),
                  fullscreenDialog: true,
                ),
              ),
            },
            child: Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
              width: cardSize - cardMarginVertical,
              // height: 200, // auto?
              alignment: Alignment.topCenter,

              child: Stack(
                children: [
                  // card background image
                  Positioned(
                      child: Hero(
                        tag: '_eventHeroNo' + this.content.eventId.toString(),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Const.borderRadius)),
                            image: DecorationImage(
                              image: NetworkImage(content.thumbnailImg),
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0),
                  // dateOvalContainer
                  Positioned(
                    child: EventDateOvalContainer(
                      size: (cardSize - cardMarginVertical) * 0.25,
                      date:
                          TimestampUtil.getDateStringOfTimeStamp(content.start),
                      dayOfWeek:
                          TimestampUtil.getDayStringOfTimeStamp(content.start),
                    ),
                    top: 0,
                    left: 0,
                  ),

                  // bottom line
                  //// blur
                  Positioned(
                    height: bottomContainerSize,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(Const.borderRadius),
                        bottomRight: Radius.circular(Const.borderRadius),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(color: Colors.white.withOpacity(0.7)),
                      ),
                    ),
                    left: 0,
                    right: 0,
                    bottom: 0,
                  ),
                  //// contents
                  Positioned(
                      child: Container(
                        height: bottomContainerSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(Const.borderRadius),
                            bottomRight: Radius.circular(Const.borderRadius),
                          ),
                        ),
                        child: EventCardBottomContainer(
                          title: content.title,
                          communityName: CommunityDataQuery.getBaiscInfoById(
                              joinedCommunityList: context.select(
                                  (JoinedCommunityList joinedCommunityList) =>
                                      joinedCommunityList),
                              communityId:
                                  content.communityId)["communityName"],
                          iconImg: CommunityDataQuery.getBaiscInfoById(
                              joinedCommunityList: context.select(
                                  (JoinedCommunityList joinedCommunityList) =>
                                      joinedCommunityList),
                              communityId: content.communityId)["iconImg"],
                          location: content.location,
                          startTime: TimestampUtil.getTimeStringOfTimeStamp(
                              content.start),
                          endTime: TimestampUtil.getTimeStringOfTimeStamp(
                              content.end),
                        ),
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.only(
                          left: Const.borderRadius,
                          right: Const.borderRadius,
                        ),
                      ),
                      left: 0,
                      right: 0,
                      bottom: 0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
