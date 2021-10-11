import 'package:Inhouse/component/icon/iconOverlayContainer.dart';
import 'package:Inhouse/util/modal.dart';
import 'package:flutter/material.dart';

class EventDetailBasicInfoContainer extends StatelessWidget {
  const EventDetailBasicInfoContainer(
      {Key key,
      @required this.height,
      @required this.horizontalPadding,
      @required this.verticalRowMargin,
      @required this.descriptionFontColor})
      : super(key: key);
  final double height;
  final double horizontalPadding;
  final double verticalRowMargin;
  final Color descriptionFontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      margin: EdgeInsets.symmetric(vertical: verticalRowMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // community name
          Container(
            alignment: Alignment.centerLeft,
            height: height,
            child: Text("上智大学軽音楽同好会",
                style: TextStyle(color: descriptionFontColor)),
          ),
          // date
          Container(
            alignment: Alignment.centerLeft,
            height: height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Container(
                          child:
                              Icon(Icons.event, color: descriptionFontColor)),
                      Container(
                        child: Text("2021/12/25",
                            style: TextStyle(color: descriptionFontColor)),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Container(
                          child:
                              Icon(Icons.timer, color: descriptionFontColor)),
                      Container(
                        child: Text("12:00 - 15:00",
                            style: TextStyle(color: descriptionFontColor)),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
              ],
            ),
          ),
          // Number of participants
          Container(
            alignment: Alignment.centerLeft,
            height: height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Container(
                          child:
                              Icon(Icons.people, color: descriptionFontColor)),
                      Container(
                        child: Text("123人参加予定",
                            style: TextStyle(color: descriptionFontColor)),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: IconOverLayContainer(
                    size: height,
                  ),
                ),
              ],
            ),
          ),
          // location
          Container(
            alignment: Alignment.centerLeft,
            height: height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Container(
                          child: Icon(Icons.location_on,
                              color: descriptionFontColor)),
                      Container(
                        child: Text("東京都千代田区紀尾井町7-1",
                            style: TextStyle(color: Colors.green[400])),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
