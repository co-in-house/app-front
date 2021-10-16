import 'dart:ui';

import 'package:Inhouse/component/event/browse/dateOvalContainer.dart';
import 'package:Inhouse/component/event/browse/oneCard/eventCardBottomContainer.dart';
import 'package:Inhouse/model/event/attendee/attendees.dart';
import 'package:Inhouse/model/event/eventList.dart';
import 'package:Inhouse/service/api/event/getAttendeesService.dart';
import 'package:Inhouse/util/util.dart';
import 'package:Inhouse/view/event/eventDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

// event 1 card container
class EventCardContainer extends HookWidget {
  EventCardContainer({this.content});
  final OneCardOnEventList content;
  final double cardMarginVertical = 10.0;
  final String _url = 'comgooglemaps://?q=hokkaido';
  final String _secondUrl =
      'https://www.google.co.jp/maps/place/%E3%82%AA%E3%83%AA%E3%83%B3%E3%83%94%E3%83%83%E3%82%AF%E3%82%B9%E3%82%BF%E3%82%B8%E3%82%A2%E3%83%A0%EF%BC%88%E6%9D%B1%E4%BA%AC2020%E5%A4%A7%E4%BC%9A%EF%BC%89/@35.6778995,139.7123581,17z/data=!3m1!4b1!4m5!3m4!1s0x60188d89aadfca4d:0xd846ee769ca6898e!8m2!3d35.6778952!4d139.7145468?hl=ja';

  @override
  Widget build(BuildContext context) {
    final isCardPushed = useState<bool>(false);
    double cardSize =
        MediaQuery.of(context).size.width * Const.eventCardWidthSizePercentage;
    double bottomContainerSize = cardSize * 0.25;
    return AnimatedPadding(
      duration: const Duration(milliseconds: 240),
      padding: EdgeInsets.all(isCardPushed.value ? 24 : 0),
      child: Card(
        margin:
            EdgeInsets.symmetric(vertical: cardMarginVertical, horizontal: 10),
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
              ),
            ),
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            width: cardSize - cardMarginVertical,
            // height: 200, // auto?
            alignment: Alignment.topCenter,

            child: Stack(
              children: [
                // card background image
                Positioned(
                    child: Hero(
                      tag: '_eventHeroNo' + this.content.id.toString(),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(Const.borderRadius)),
                          image: DecorationImage(
                            image: NetworkImage(content.img),
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
                    date: "2 4",
                    dayOfWeek: "WED",
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
                        height: bottomContainerSize - 10,
                        title: content.eventTitle,
                        date: content.eventDayOfWeek + "," + content.eventDate,
                        communityName: content.communityName,
                        totalMemberOfMember: 12,
                        maxMemberOfMember: 20,
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
    );
  }
}


// マップで確認
//OsAccess.launchURL(_url, secondUrl: _secondUrl);