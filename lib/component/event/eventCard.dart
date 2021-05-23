import 'package:Inhouse/model/eventList.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final OneCardOnEventList content;
  EventCard({this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 0.0),
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
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 2.0,
        child: Container(
          margin: const EdgeInsets.all(10.0),
          width: 300,
          height: 100,
          alignment: Alignment.topCenter,
          // child: Image.asset('images/' + content.img, fit: BoxFit.fill),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    // fit: BoxFit.fill,
                    image: AssetImage('images/' + content.img),
                  ),
                ),
              ),
              Text('action buttons line'),
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
