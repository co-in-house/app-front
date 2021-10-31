import 'package:inhouse/component/lounge/newRoomModalContainer.dart';
import 'package:inhouse/model/lounge/tappedRoomInfoForModal.dart';
import 'package:inhouse/util/modal.dart';
import 'package:inhouse/util/theme.dart';
import 'package:inhouse/util/util.dart';
import 'package:flutter/material.dart';

class ActiveRoomButton extends StatelessWidget {
  const ActiveRoomButton({
    Key key,
    @required this.index,
    @required this.label,
  }) : super(key: key);
  final int index;
  final String label;

  final double _height = 34;
  final double _radiusCircular = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      width: MediaQuery.of(context).size.width * 0.4,
      height: _height,
      child: ElevatedButton(
        onPressed: () {
          print("onPressed!");
          Navigator.pop(context,
              TappedRoomInfoForModal(index: this.index, label: this.label));
        },
        style: ElevatedButton.styleFrom(
            elevation: 3.0,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_radiusCircular),
            )),
        child: Ink(
          decoration: BoxDecoration(
            gradient: CustomColor.linearGradient(index),
            borderRadius: BorderRadius.circular(_radiusCircular),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              label,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

class ClosedRoomButton extends StatelessWidget {
  const ClosedRoomButton({
    Key key,
    @required this.index,
    @required this.label,
  }) : super(key: key);
  final int index;
  final String label;

  final double _height = 34;
  final double _radiusCircular = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      width: MediaQuery.of(context).size.width * 0.4,
      height: _height,
      child: ElevatedButton(
        onPressed: () {
          print("onPressed!");
          Navigator.pop(context, this.index);
        },
        style: ElevatedButton.styleFrom(
            elevation: 3.0,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_radiusCircular),
            )),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(_radiusCircular),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              label,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

class NewRoomButton extends StatelessWidget {
  const NewRoomButton({
    Key key,
  }) : super(key: key);

  final double _height = 34;
  final double _radiusCircular = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 20),
      width: MediaQuery.of(context).size.width * 0.4,
      height: _height,
      child: ElevatedButton(
        onPressed: () async {
          print("onPressed!");
          int tappedRoomNumber = await roomModal(
            context: context,
            content: NewRoomModalContainer(),
          );
          print("tappedRoomNumber is " + tappedRoomNumber.toString());
          if (tappedRoomNumber != null) {}
        },
        style: ElevatedButton.styleFrom(
            elevation: 3.0,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_radiusCircular),
            )),
        child: Ink(
          decoration: BoxDecoration(
            color: inhouseThemeColor.highlightColor,
            borderRadius: BorderRadius.circular(_radiusCircular),
          ),
          child: Container(
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, size: 30),
                  Text(
                    "Start new room",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
