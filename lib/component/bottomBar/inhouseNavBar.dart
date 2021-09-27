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

class InhouseNavBar extends StatelessWidget {
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
                    Icon(Icons.explore_outlined, size: 30),
                    Icon(Icons.event, size: 30),
                    // Icon(Icons.apps, size: 30),
                    _BottomLoungeIcon(size: 30),
                    // Icon(Icons.message_rounded, size: 30),
                    Icon(Icons.ondemand_video, size: 30),
                    _BottomUserIcon(
                      size: 30,
                      url:
                          'https://66.media.tumblr.com/c063f0b98040e8ec4b07547263b8aa15/tumblr_inline_ppignaTjX21s9on4d_540.jpg',
                    ),
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

class _BottomUserIcon extends StatelessWidget {
  const _BottomUserIcon({Key key, @required this.size, @required this.url})
      : super(key: key);
  final double size;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        backgroundImage: NetworkImage(this.url),
        backgroundColor: Colors.green,
        radius: size * 0.6,
      ),
    );
  }
}

class _BottomLoungeIcon extends StatelessWidget {
  const _BottomLoungeIcon({Key key, @required this.size}) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: CircleAvatar(
        backgroundImage: AssetImage("images/logo_w.png"),
        backgroundColor: Colors.green,
        radius: size * 0.6,
      ),
    );
  }
}
