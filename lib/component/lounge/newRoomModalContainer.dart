import 'package:inhouse/component/lounge/roomModalContainer.dart';
import 'package:inhouse/component/lounge/roomTypeSelectRow.dart';
import 'package:inhouse/util/inhouseWidget.dart';
import 'package:inhouse/util/theme.dart';
import 'package:flutter/material.dart';

class NewRoomModalContainer extends StatelessWidget {
  final double _startButtonSize = 16;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InhouseWidget.toggleContainer(),
          InhouseWidget.dividerContainer(),
          RoomModalCommunityInfoRow(),
          InhouseWidget.dividerContainer(),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: TextField(
              decoration:
                  InputDecoration(icon: Icon(Icons.label), hintText: "ルーム名"),
              style: TextStyle(height: 1.2),
            ),
          ),
          RoomTypeSelectRow(),
          Container(
            child: ElevatedButton.icon(
              icon: Icon(
                Icons.sports_handball,
                color: Colors.white,
                size: this._startButtonSize,
              ),
              label: Text(
                'Let`s go!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: this._startButtonSize,
                ),
              ),
              style: ElevatedButton.styleFrom(
                animationDuration: Duration(seconds: 10),
                primary: inhouseThemeColor.primaryColor,
                onPrimary: Colors.white,
                elevation: 10,
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
    );
  }
}
