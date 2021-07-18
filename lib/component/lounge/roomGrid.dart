import 'package:Inhouse/component/lounge/roomButton.dart';
import 'package:flutter/material.dart';

class RoomGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // スクロールの向きを水平方向に指定
      child: Row(
        children: [
          Column(children: [
            RoomButton(index: 1, label: 'R1'),
            RoomButton(index: 2, label: 'R2'),
          ]),
          Column(children: [
            RoomButton(index: 3, label: 'R3'),
            RoomButton(index: 4, label: 'R4'),
          ]),
          Column(children: [
            RoomButton(index: 5, label: 'R5'),
            RoomButton(index: 6, label: 'R6'),
          ]),
          Column(children: [
            RoomButton(index: 7, label: 'R7'),
            RoomButton(index: 8, label: 'R8'),
          ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                margin: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: ElevatedButton(
                  child: Text("add +", style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    animationDuration: Duration(seconds: 10),
                    primary: Colors.grey,
                    onPrimary: Colors.green,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () => {print("onPressed")},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
