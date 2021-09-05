import 'package:Inhouse/model/cutList.dart';
import 'package:Inhouse/model/lounge/roomState.dart';
import 'package:Inhouse/model/routingState.dart';
import 'package:Inhouse/service/api/getCutListService.dart';
import 'package:Inhouse/service/changePage.dart';
import 'package:Inhouse/util/theme.dart';
import 'package:Inhouse/util/util.dart';
import 'package:Inhouse/view/cut/cutPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
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
                  height: Const.footerHeight,
                  items: <Widget>[
                    // Icon(Icons.home, size: 30),
                    Icon(Icons.explore, size: 30),
                    Icon(Icons.apps, size: 30),
                    Icon(Icons.event_available, size: 30),
                    // Icon(Icons.message_rounded, size: 30),
                    Icon(Icons.video_library, size: 30),
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
                    if (index == Const.routingNoCut) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MultiProvider(
                            providers: [
                              StateNotifierProvider<GetCutListService, CutList>(
                                create: (context) => GetCutListService(),
                              ),
                            ],
                            child: CutPage(),
                          ),
                        ),
                      );
                    } else {
                      context.read<ChangePage>().set(index);
                    }
                  },
                ),
        );
      },
    );
  }
}

class ChatBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(color: inhouseThemeColor.backgroundColor),
      child: Container(
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
          top: 10,
          bottom: 25,
        ),
        // decoration: BoxDecoration(color: Colors.red),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      gradient: CustomColor.linearGradient(context
                          .select((RoomState roomState) => roomState)
                          .index),
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: EdgeInsets.only(
                      left: 4,
                      right: 16,
                      top: 4,
                      bottom: 4,
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.input),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(hintText: "おしゃべりしてみる"),
                            style: TextStyle(height: 1.2),
                          ),
                        )
                      ],
                    )),
              ),
              Icon(Icons.send, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
