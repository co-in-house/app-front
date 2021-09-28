import 'dart:ui';

import 'package:Inhouse/component/icon/communityIconContainer.dart';
import 'package:Inhouse/component/icon/iconContainer.dart';
import 'package:Inhouse/component/icon/iconOverlayContainer.dart';
import 'package:Inhouse/model/eventList.dart';
import 'package:Inhouse/util/format.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class EventCard extends StatelessWidget {
  final OneCardOnEventList content;
  EventCard({this.content});

  final String _url = 'comgooglemaps://?q=hokkaido';
  final String _secondUrl =
      'https://www.google.co.jp/maps/place/%E3%82%AA%E3%83%AA%E3%83%B3%E3%83%94%E3%83%83%E3%82%AF%E3%82%B9%E3%82%BF%E3%82%B8%E3%82%A2%E3%83%A0%EF%BC%88%E6%9D%B1%E4%BA%AC2020%E5%A4%A7%E4%BC%9A%EF%BC%89/@35.6778995,139.7123581,17z/data=!3m1!4b1!4m5!3m4!1s0x60188d89aadfca4d:0xd846ee769ca6898e!8m2!3d35.6778952!4d139.7145468?hl=ja';
  // final String _url = 'https://flutter.dev';

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 2.0,
      child: InkWell(
        onTap: () => eventModal(context),
        child: Container(
          margin: const EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width * 0.80,
          // height: 120, // 呼び出しclass側で高さ固定。SliverFixedExtentList itemExtent
          alignment: Alignment.centerLeft,
          // child: Image.asset('images/' + content.img, fit: BoxFit.fill),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(Const.borderRadius)),
            image: DecorationImage(
              image: NetworkImage(
                  "https://64.media.tumblr.com/f3549bc0507982b3b1753c2e3f3930f8/d55773cd29b07d7e-ec/s2048x3072/cf8046ca4f57c3f93895baa24d99e46efe5e4e23.jpg"),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // header date line
              Container(
                color: Colors.white.withOpacity(0.8),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
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
              ),
              // contents line
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    this.content.eventTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    this.content.eventDescription,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey),
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
                      Container(
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
              Divider(),
              // bottom line
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconContainer(size: 40, url: this.content.communityIconUrl),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(this.content.communityName),
                      Text(
                        "@" + this.content.communityId,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
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
                            // mapModal(context);
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

  void mapModal(BuildContext context) {
    final double _circular = 20.0;
    showModalBottomSheet(
      //モーダルの背景の色、透過
      backgroundColor: Colors.transparent,
      //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          padding: EdgeInsets.symmetric(
              vertical: _circular,
              horizontal: MediaQuery.of(context).size.width * 0.05),
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
            child: Text("マップが表示されるといいよね"),
          ),
        );
      },
    );
  }
}

// event 1 card container
class EventCardContainer extends StatelessWidget {
  EventCardContainer({this.content});
  final OneCardOnEventList content;
  final double cardMarginVertical = 10.0;
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
        onTap: () {
          print("tapped!");
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
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(Const.borderRadius)),
                      image: DecorationImage(
                        image: NetworkImage(content.img),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0),
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
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(color: Colors.white.withOpacity(0.5)),
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
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: Const.borderRadius),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: <Widget>[
                  Icon(Icons.group),
                  Text(
                    this.communityName,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Icon(Icons.calendar_today),
                  Text(
                    this.date,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Icon(Icons.person),
                  Text(
                    this.totalMemberOfMember.toString() +
                        "/" +
                        this.maxMemberOfMember.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.add,
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
    );
  }
}
