import 'package:Inhouse/component/icon/iconContainer.dart';
import 'package:Inhouse/component/icon/iconOverlayContainer.dart';
import 'package:Inhouse/model/eventList.dart';
import 'package:Inhouse/util/format.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final OneCardOnEventList content;
  EventCard({this.content});

  final String eventDate = "12月25日";
  final String eventDayOfWeek = "土";
  final String eventYear = "2021";

  final String eventTitle = "イベントのタイトル";
  final String eventDescription =
      "イベントの詳細イベントの詳細イベントの詳細イベントの詳細イベントの詳細イベントの詳細イベントの詳細イベントの詳細";

  final int eventAmountOfMember = 12345;

  final String communityName = "CommunityName";
  final String communityId = "CommunityId";
  final String communityIconUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwy4yt4ozcMfk1kGbhgMPxolXmlawudTRujQ&usqp=CAU";

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 2.0,
      child: InkWell(
        onTap: () {
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
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  height: 600,
                  // alignment: Alignment.topCenter,
                  padding:
                      EdgeInsets.symmetric(vertical: 100.0, horizontal: 0.0),
                  child: Text(
                    'イベント詳細',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              );
            },
          );
        },
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
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text: this.eventDate + '('),
                        TextSpan(
                            text: this.eventDayOfWeek,
                            style: TextStyle(color: Colors.red)),
                        TextSpan(text: ')'),
                        TextSpan(
                            text: ' / ' + this.eventYear,
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
              // contents line
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    this.eventTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    this.eventDescription,
                    maxLines: 2,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    children: [
                      IconOverLayContainer(),
                      Container(
                        child: Text(
                          NumberUtil.formattedInteger(
                                  this.eventAmountOfMember) +
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
                  IconContainer(size: 40, url: this.communityIconUrl),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(this.communityName),
                      Text(
                        "@" + this.communityId,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // child: Container(
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     image: DecorationImage(
          //       // fit: BoxFit.fill,
          //       image: AssetImage('images/' + content.img),
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
