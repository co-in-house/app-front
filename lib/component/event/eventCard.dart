import 'dart:ui';

import 'package:Inhouse/component/event/dateOvalContainer.dart';
import 'package:Inhouse/component/event/eventJoinButtonContainer.dart';
import 'package:Inhouse/component/icon/communityIconContainer.dart';
import 'package:Inhouse/component/icon/iconContainer.dart';
import 'package:Inhouse/component/icon/iconOverlayContainer.dart';
import 'package:Inhouse/model/eventList.dart';
import 'package:Inhouse/util/format.dart';
import 'package:Inhouse/util/util.dart';
import 'package:Inhouse/view/event/eventDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// event 1 card container
class EventCardContainer extends StatelessWidget {
  EventCardContainer({this.content});
  final OneCardOnEventList content;
  final double cardMarginVertical = 10.0;
  final String _url = 'comgooglemaps://?q=hokkaido';
  final String _secondUrl =
      'https://www.google.co.jp/maps/place/%E3%82%AA%E3%83%AA%E3%83%B3%E3%83%94%E3%83%83%E3%82%AF%E3%82%B9%E3%82%BF%E3%82%B8%E3%82%A2%E3%83%A0%EF%BC%88%E6%9D%B1%E4%BA%AC2020%E5%A4%A7%E4%BC%9A%EF%BC%89/@35.6778995,139.7123581,17z/data=!3m1!4b1!4m5!3m4!1s0x60188d89aadfca4d:0xd846ee769ca6898e!8m2!3d35.6778952!4d139.7145468?hl=ja';

  @override
  Widget build(BuildContext context) {
    double cardSize =
        MediaQuery.of(context).size.width * Const.eventCardWidthSizePercentage;
    double bottomContainerSize = cardSize * 0.25;
    return Card(
      margin:
          EdgeInsets.symmetric(vertical: cardMarginVertical, horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Const.borderRadius),
      ),
      elevation: 3.0,
      child: InkWell(
        // onTap: () => eventModal(context),
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventDetailPage(eventInfo: this.content),
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
                    child: _EventBottomContentsContainer(
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
    );
  }

  void eventModal(BuildContext context) {
    final double _circular = 20.0;
    showModalBottomSheet(
      //モーダルの背景の色、透過
      backgroundColor: Colors.transparent,
      //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.only(top: 1),
          decoration: BoxDecoration(
            //モーダル自体の色
            color: Colors.white,
            //角丸にする
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_circular),
              topRight: Radius.circular(_circular),
            ),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.50,
            // alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(
                vertical: _circular,
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Container(
              margin: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width * 0.80,
              // height: 120, // 呼び出しclass側で高さ固定。SliverFixedExtentList itemExtent
              alignment: Alignment.centerLeft,
              // child: Image.asset('images/' + content.img, fit: BoxFit.fill),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // header date line
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconContainer(
                          size: 40, url: this.content.communityIconUrl),
                      Text(this.content.communityName),
                      Text(
                        "@" + this.content.communityId,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.date_range_outlined, color: Colors.black),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(text: '13:00~17:00 '),
                                TextSpan(text: this.content.eventDate + '('),
                                TextSpan(
                                    text: this.content.eventDayOfWeek,
                                    style: TextStyle(color: Colors.red)),
                                TextSpan(text: ')'),
                                TextSpan(
                                    text: ' / ' + this.content.eventYear,
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            print("onTap called.");
                          },
                          child: Text("カレンダーに追加",
                              style: TextStyle(color: Colors.green)),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.subject_outlined, color: Colors.black),
                          Text(this.content.eventTitle),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.black),
                          Text("住所とか表示する?"),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            OsAccess.launchURL(_url, secondUrl: _secondUrl);
                          },
                          child: Text("Mapで確認する",
                              style: TextStyle(color: Colors.green)),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.subtitles_outlined, color: Colors.black),
                          Expanded(
                            child: Container(
                              child: Text(
                                this.content.eventDescription,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconOverLayContainer(),
                          Container(
                            child: Text(
                              NumberUtil.formattedInteger(
                                      this.content.eventAmountOfMember) +
                                  "人",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          ),
                          label: Text(
                            '参加する',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            animationDuration: Duration(seconds: 10),
                            primary: Colors.grey,
                            onPrimary: Colors.green,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            print("onPressed");
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _EventBottomContentsContainer extends StatelessWidget {
  const _EventBottomContentsContainer({
    Key key,
    this.title,
    this.date,
    this.maxMemberOfMember,
    this.totalMemberOfMember,
    this.height,
    this.communityName,
  }) : super(key: key);
  final String communityName;
  final String title;
  final String date;
  final int maxMemberOfMember;
  final int totalMemberOfMember;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Text(
            this.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: CommunityIconContainer(
                size: 45,
                url:
                    "https://pbs.twimg.com/media/DptRhNTUcAAILew?format=jpg&name=large",
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "軽音楽同好会",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "オンライン | 12:00-19:00 | 12人",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            EventJoinButtonContainer(),
          ],
        ),
      ],
    );
  }
}
