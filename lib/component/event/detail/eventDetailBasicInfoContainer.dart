import 'package:Inhouse/component/icon/communityIconContainer.dart';
import 'package:flutter/material.dart';

class EventDetailBasicInfoContainer extends StatelessWidget {
  const EventDetailBasicInfoContainer({
    Key key,
    @required this.height,
    @required this.horizontalPadding,
    @required this.verticalRowMargin,
    @required this.descriptionFontColor,
  }) : super(key: key);
  final double height;
  final double horizontalPadding;
  final double verticalRowMargin;
  final Color descriptionFontColor;

  @override
  Widget build(BuildContext context) {
    double _iconRightMargin = 10.0;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      margin: EdgeInsets.symmetric(vertical: verticalRowMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
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
                          margin: EdgeInsets.only(right: _iconRightMargin),
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
                          margin: EdgeInsets.only(right: _iconRightMargin),
                          child:
                              Icon(Icons.timer, color: descriptionFontColor)),
                      Container(
                        child: Text("12:00 - 15:00",
                            style: TextStyle(color: descriptionFontColor)),
                      ),
                    ],
                  ),
                ),
                // Flexible(
                //   flex: 1,
                //   child: Container(),
                // ),
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
                          margin: EdgeInsets.only(right: _iconRightMargin),
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
          // Number of participants
          // Container(
          //   alignment: Alignment.centerLeft,
          //   height: height,
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Flexible(
          //         flex: 1,
          //         child: Row(
          //           children: [
          //             Container(
          //                 child:
          //                     Icon(Icons.people, color: descriptionFontColor)),
          //             Container(
          //               child: Text("123人参加予定",
          //                   style: TextStyle(color: descriptionFontColor)),
          //             ),
          //           ],
          //         ),
          //       ),
          //       Flexible(
          //         flex: 1,
          //         child: IconOverLayContainer(
          //           size: height,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            // height: height,
            child: Divider(),
          ),
          // community info
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
              Container(
                alignment: Alignment.centerLeft,
                // height: height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "上智大学軽音楽同好会",
                      style: TextStyle(
                        // color: descriptionFontColor,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90 - 60,
                      child: Text(
                        "上智内で最強なバンドサークル。俺たちが最強たる所以は",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: descriptionFontColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            // height: height,
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
