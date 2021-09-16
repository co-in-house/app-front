import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';

class RoomTypeSelectRow extends StatefulWidget {
  @override
  _RoomTypeSelectRowState createState() => _RoomTypeSelectRowState();
}

class _RoomTypeSelectRowState extends State<RoomTypeSelectRow> {
  int selectedType = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 4,
        bottom: 4,
        left: 10,
        right: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buttonContainer("room_real.png", "実名?ルーム", 1),
          buttonContainer("room_anonymous.png", "匿名ルーム", 2),
        ],
      ),
    );
  }

  Container buttonContainer(
      String _assetImageFileName, String _label, int type) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      alignment: Alignment.topCenter,
      width: Const.roomTypeIconSize + 30,
      height: Const.roomTypeIconSize + 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Const.borderRadius)),
        color: selectedType == type ? Colors.green[100] : Colors.grey[100],
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedType = type;
          });
        },
        child: Column(
          children: [
            Container(
              width: Const.roomTypeIconSize,
              height: Const.roomTypeIconSize,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(Const.borderRadius)),
                // color: Colors.green,
                image: DecorationImage(
                  image: AssetImage("images/$_assetImageFileName"),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Container(
              child: Text(
                _label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
