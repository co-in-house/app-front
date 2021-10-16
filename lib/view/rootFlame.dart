import 'package:Inhouse/component/bottomBar/inhouseNavBar.dart';
import 'package:Inhouse/component/floatingButton.dart';
import 'package:Inhouse/component/lounge/miniChatContainer.dart';
import 'package:Inhouse/model/lounge/roomState.dart';
import 'package:Inhouse/model/lounge/tappedRoomInfoForModal.dart';
import 'package:Inhouse/model/routingState.dart';
import 'package:Inhouse/model/userState.dart';
import 'package:Inhouse/service/api/getCommunityListService.dart';
import 'package:Inhouse/service/api/event/getEventListService.dart';
import 'package:Inhouse/service/api/getLocationListService.dart';
import 'package:Inhouse/service/api/getPostListService.dart';
import 'package:Inhouse/service/api/getTagListService.dart';
import 'package:Inhouse/service/external/content/firebaseStorageController.dart';
import 'package:Inhouse/service/lounge/changeRoom.dart';
import 'package:Inhouse/util/util.dart';
import 'package:Inhouse/util/wrapper.dart';
import 'package:Inhouse/view/event/eventPage.dart';
import 'package:Inhouse/view/explore/explorePage.dart';
import 'package:Inhouse/view/login/login.dart';
import 'package:Inhouse/view/lounge/chatPage.dart';
import 'package:Inhouse/view/lounge/loungePage.dart';
import 'package:Inhouse/view/message/messagePage.dart';
import 'package:Inhouse/view/userMenu/userMenuPage.dart';
import 'package:flutter/material.dart';
// import 'package:Inhouse/view/timeline/homePage.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:provider/provider.dart';

class RootFlame extends StatelessWidget {
  void init(BuildContext context) {}

  final List<Widget> _contentView = <Widget>[
    // HomePage(),
    ExplorePage(),
    EventPage(),
    LoungePage(),
    MessagePage(),
    // CutPage(),
    UserMenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    init(context);
    // final int _roomIndex =
    //     context.select((RoomState roomState) => roomState).index;
    final RoomState _tappedRoomState =
        context.select((RoomState roomState) => roomState);

    return StatefulWrapper(
      onInit: () async {
        await FirebaseStorageAccess().initialize();
        // 初期API call
        // master list 取得
        context.read<GetLocationListService>().call();
        context.read<GetPostListService>().call();
        context.read<GetCommunityListService>().call("");
        context.read<GetEventListService>().call();
        context.read<GetTagListService>().call();
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchOutCurve: Curves.fastLinearToSlowEaseIn,
        child: !context.select((UserState state) => state).isLogined
            ? LoginPage()
            : Scaffold(
                // drawer: CustomDrawer(context: context),
                floatingActionButton: CustomFloatingButton(),
                bottomNavigationBar: InhouseNavBar(),
                body: Stack(
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
                          print(Const.playerExpandProgress.value.toString());
                          if (_tappedRoomState.index == 0)
                            return const SizedBox.shrink();
                          if (percentage <= 0.5) {
                            return MiniChatContainer(
                                tappedRoomState: _tappedRoomState);
                          }
                          return ChatPage(roomName: _tappedRoomState.roomName);
                        },
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
