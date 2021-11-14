import 'package:inhouse/component/bottomNavBar/inhouseBNB.dart';
import 'package:inhouse/component/floating/newEventFB.dart';
import 'package:inhouse/component/lounge/miniChatContainer.dart';
import 'package:inhouse/model/lounge/roomState.dart';
import 'package:inhouse/model/routingState.dart';
import 'package:inhouse/model/userState.dart';
import 'package:inhouse/service/api/community/GetJoinedComService.dart';
import 'package:inhouse/service/api/getCommunityListService.dart';
import 'package:inhouse/service/api/event/getEventListService.dart';
import 'package:inhouse/service/external/content/firebaseStorageController.dart';
import 'package:inhouse/service/external/icos/icosController.dart';
import 'package:inhouse/util/util.dart';
import 'package:inhouse/util/wrapper.dart';
import 'package:inhouse/view/event/eventPage.dart';
import 'package:inhouse/view/explore/explorePage.dart';
import 'package:inhouse/view/login/login.dart';
import 'package:inhouse/view/lounge/chatPage.dart';
import 'package:inhouse/view/lounge/loungePage.dart';
import 'package:inhouse/view/userMenu/userMenuPage.dart';
import 'package:flutter/material.dart';
// import 'package:inhouse/view/timeline/homePage.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:provider/provider.dart';

class RootFlame extends StatelessWidget {
  final GlobalKey rootKey = GlobalKey<ScaffoldState>();

  void init(BuildContext context) {}

  final List<Widget> _contentView = <Widget>[
    LoungePage(),
    ExplorePage(),
    EventPage(),
    // MessagePage(),
    // CutPage(),
    UserMenuPage(),
  ];

  final List<Widget> _fbList = <Widget>[
    Container(),
    Container(),
    NewEventFB(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    init(context);
    // final int _roomIndex =
    //     context.select((RoomState roomState) => roomState).index;
    // ICOSController().test();
    final RoomState _tappedRoomState =
        context.select((RoomState roomState) => roomState);

    return StatefulWrapper(
      onInit: () async {
        await FirebaseStorageAccess().initialize();
        // 初期API call
        // master list 取得
        context.read<GetCommunityListService>().call("");
        context.read<GetEventListService>().call(communityIdList: [1, 2, 3]);
        context.read<GetJoinedCommunityListService>().call(userid: 1);
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchOutCurve: Curves.fastLinearToSlowEaseIn,
        child: !context.select((UserState state) => state).isLogined
            ? LoginPage()
            : Scaffold(
                key: rootKey,
                // drawer: CustomDrawer(context: context),
                floatingActionButton: Builder(
                  builder: (context) {
                    return _fbList[context
                        .select((RoutingState state) => state)
                        .routingState];
                  },
                ),
                bottomNavigationBar: InhouseBNB(),
                body: Builder(
                  builder: (context) {
                    return Stack(
                      children: [
                        _contentView[context
                            .select((RoutingState state) => state)
                            .routingState],
                        Offstage(
                          offstage: _tappedRoomState.index == 0,
                          child: Miniplayer(
                            valueNotifier: Const.playerExpandProgress,
                            // curve: Curves.easeInOut,
                            controller: Const.miniplayerController,
                            minHeight: Const.miniPlayerMinimumSize,
                            maxHeight: MediaQuery.of(context).size.height,
                            builder: (height, percentage) {
                              print(
                                  Const.playerExpandProgress.value.toString());
                              if (_tappedRoomState.index == 0)
                                return const SizedBox.shrink();
                              if (percentage <= 0.5) {
                                return MiniChatContainer(
                                    tappedRoomState: _tappedRoomState);
                              }
                              return ChatPage(
                                  roomName: _tappedRoomState.roomName);
                            },
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
      ),
    );
  }
}
