import 'package:Inhouse/component/icon/iconContainer.dart';
import 'package:Inhouse/component/icon/iconOverlayContainer.dart';
import 'package:Inhouse/model/eventList.dart';
import 'package:Inhouse/util/format.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';

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
              // contents line
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    this.content.eventTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
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
