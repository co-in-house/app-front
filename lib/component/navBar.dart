import 'package:Inhouse/model/lounge/roomState.dart';
import 'package:Inhouse/model/routingState.dart';
import 'package:Inhouse/service/changePage.dart';
import 'package:Inhouse/util/theme.dart';
import 'package:Inhouse/util/util.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: Const.playerExpandProgress,
      builder: (context, _listenableValue, _) {
        print(
            "_listenableValue: $_listenableValue, Const.miniPlayerMinimumSize: " +
                Const.miniPlayerMinimumSize.toString());

        return AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: (context.select((RoomState roomState) => roomState).index !=
                      0) &&
                  (_listenableValue > MediaQuery.of(context).size.height * 0.5)
              ? 0
              : 75,
          child: (context.select((RoomState roomState) => roomState).index !=
                      0) &&
                  (_listenableValue > MediaQuery.of(context).size.height * 0.5)
              ? Container()
              : CurvedNavigationBar(
                  items: <Widget>[
                    Icon(Icons.home, size: 30),
                    Icon(Icons.explore, size: 30),
                    Icon(Icons.apps, size: 30),
                    Icon(Icons.event_available, size: 30),
                    Icon(Icons.message_rounded, size: 30),
                  ],
                  color: Colors.white,
                  index: context
                      .select((RoutingState state) => state)
                      .routingState,
                  buttonBackgroundColor: Colors.white,
                  backgroundColor:
                      inhouseThemeColor.bannerTheme.backgroundColor,
                  animationCurve: Curves.easeInOut,
                  animationDuration: Duration(milliseconds: 600),
                  onTap: (index) {
                    context.read<ChangePage>().set(index);
                  },
                ),
        );
      },
    );
  }
}
