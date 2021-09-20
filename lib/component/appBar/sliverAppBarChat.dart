// SliverAppBar for Chat
import 'package:Inhouse/model/lounge/roomState.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:provider/provider.dart';

class SliverAppBarChat extends StatelessWidget {
  const SliverAppBarChat({Key key, @required this.roomName}) : super(key: key);
  final String roomName;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: CustomColor.linearGradient(
              context.select((RoomState roomState) => roomState).index),
        ),
      ),
      title: Text(this.roomName),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      floating: true,
      pinned: true,
      snap: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_circle_down),
        onPressed: () =>
            Const.miniplayerController.animateToHeight(state: PanelState.MIN),
      ),
    );
  }
}
