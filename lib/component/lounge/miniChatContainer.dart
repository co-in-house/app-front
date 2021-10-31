import 'package:inhouse/model/lounge/roomState.dart';
import 'package:inhouse/service/lounge/changeRoom.dart';
import 'package:inhouse/util/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MiniChatContainer extends StatelessWidget {
  const MiniChatContainer({Key key, @required this.tappedRoomState})
      : super(key: key);
  final RoomState tappedRoomState;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: CustomColor.linearGradient(tappedRoomState.index),
      ),
      child: Container(
        // margin: EdgeInsets.only(top: 10),
        // padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          // borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
        ),
        child: Row(
          children: [
            Container(
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => context.read<ChangeRoom>().close(),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tappedRoomState.roomName,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "@" + tappedRoomState.communityName,
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: Container(
            //     width: 30,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
            //       gradient: CustomColor.linearGradient(tappedRoomState.index),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
