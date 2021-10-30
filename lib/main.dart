import 'package:Inhouse/model/community/JoinedCommunity.dart';
import 'package:Inhouse/model/communityList.dart';
import 'package:Inhouse/model/event/eventList.dart';
import 'package:Inhouse/model/locationList.dart';
import 'package:Inhouse/model/lounge/roomState.dart';
import 'package:Inhouse/model/tagList.dart';
import 'package:Inhouse/model/userState.dart';
import 'package:Inhouse/service/api/community/GetJoinedComService.dart';
import 'package:Inhouse/service/api/getCommunityListService.dart';
import 'package:Inhouse/service/api/event/getEventListService.dart';
import 'package:Inhouse/service/api/getLocationListService.dart';
import 'package:Inhouse/service/api/getTagListService.dart';
import 'package:Inhouse/service/changeColorMode.dart';
import 'package:Inhouse/service/changePage.dart';
import 'package:Inhouse/service/lounge/changeRoom.dart';
import 'package:Inhouse/service/user/userService.dart';
import 'package:Inhouse/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:Inhouse/view/rootFlame.dart' as root;
import 'model/colorModeState.dart';
import 'model/routingState.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("========MyApp build========");
    return MaterialApp(
      title: 'Inhouse',
      theme: inhouseThemeColor,
      home: MultiProvider(
        providers: [
          //level1ページング
          StateNotifierProvider<ChangePage, RoutingState>(
            create: (context) => ChangePage(),
          ),
          //level2ページング
          StateNotifierProvider<ChangeRoom, RoomState>(
            create: (context) => ChangeRoom(),
          ),
          //level1業務サービス
          StateNotifierProvider<UserService, UserState>(
            create: (context) => UserService(),
          ),
          StateNotifierProvider<GetEventListService, EventMatrix>(
            create: (context) => GetEventListService(),
          ),
          StateNotifierProvider<GetCommunityListService, CommunityList>(
            create: (context) => GetCommunityListService(),
          ),
          StateNotifierProvider<GetJoinedCommunityListService,
              JoinedCommunityList>(
            create: (context) => GetJoinedCommunityListService(),
          ),
          //マスター取得
          StateNotifierProvider<GetTagListService, TagList>(
            create: (context) => GetTagListService(),
          ),
          StateNotifierProvider<GetLocationListService, LocationList>(
            create: (context) => GetLocationListService(),
          ),
          StateNotifierProvider<ChangeColorMode, ColorModeState>(
            create: (context) => ChangeColorMode(),
          ),
        ],
        child: root.RootFlame(),
      ),
    );
  }
}
