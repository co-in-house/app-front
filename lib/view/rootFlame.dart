import 'package:Inhouse/component/navBar.dart';
import 'package:Inhouse/component/drawer.dart';
import 'package:Inhouse/model/lounge/roomState.dart';
import 'package:Inhouse/model/routingState.dart';
import 'package:Inhouse/service/api/getLocationListService.dart';
import 'package:Inhouse/service/api/getPostListService.dart';
import 'package:Inhouse/service/api/getTagListService.dart';
import 'package:Inhouse/service/external/content/firebaseStorageController.dart';
import 'package:Inhouse/service/lounge/changeRoom.dart';
import 'package:Inhouse/util/util.dart';
import 'package:Inhouse/util/wrapper.dart';
import 'package:Inhouse/view/eventPage.dart';
import 'package:Inhouse/view/explorePage.dart';
import 'package:Inhouse/view/lounge/chatPage.dart';
import 'package:Inhouse/view/loungePage.dart';
import 'package:Inhouse/view/messagePage.dart';
import 'package:flutter/material.dart';
import 'package:Inhouse/view/homePage.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:provider/provider.dart';

class RootFlame extends StatelessWidget {
  void initState() {}
  final List<Widget> _contentView = <Widget>[
    HomePage(),
    ExplorePage(),
    LoungePage(),
    EventPage(),
    MessagePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final int _roomIndex =
        context.select((RoomState roomState) => roomState).index;
    return StatefulWrapper(
      onInit: () async {
        await FirebaseStorageAccess().initialize();
        // 初期API call
        // master list 取得
        context.read<GetLocationListService>().call();
        context.read<GetPostListService>().call();
        context.read<GetTagListService>().call();
      },
      child: Scaffold(
        drawer: CustomDrawer(context: context),
        // floatingActionButton: CustomFloatingButton(),
        bottomNavigationBar: CustomNavBar(),
        body: Stack(
          children: [
            _contentView[
                context.select((RoutingState state) => state).routingState],
            Offstage(
              offstage: _roomIndex == 0,
              child: Miniplayer(
                valueNotifier: Const.playerExpandProgress,
                // curve: Curves.easeInOut,
                controller: Const.miniplayerController,
                minHeight: Const.miniPlayerMinimumSize,
                maxHeight: MediaQuery.of(context).size.height,
                builder: (height, percentage) {
                  print(Const.playerExpandProgress.value.toString());
                  if (_roomIndex == 0) return const SizedBox.shrink();
                  if (percentage <= 0.5) {
                    return Container(
                      decoration: BoxDecoration(
                        gradient: CustomColor.linearGradient(_roomIndex),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => context.read<ChangeRoom>().set(0),
                          ),
                          Text('$height, $percentage'),
                        ],
                      ),
                    );
                  }
                  return ChatPage();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
