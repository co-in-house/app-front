import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:inhouse/model/community/JoinedCommunity.dart';
import 'package:inhouse/model/communityList.dart';
import 'package:inhouse/model/event/eventList.dart';
import 'package:inhouse/model/lounge/roomState.dart';
import 'package:inhouse/model/userState.dart';
import 'package:inhouse/service/api/community/GetJoinedComService.dart';
import 'package:inhouse/service/api/getCommunityListService.dart';
import 'package:inhouse/service/api/event/getEventListService.dart';
import 'package:inhouse/service/changeColorMode.dart';
import 'package:inhouse/service/changePage.dart';
import 'package:inhouse/service/lounge/changeRoom.dart';
import 'package:inhouse/service/user/userService.dart';
import 'package:inhouse/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:inhouse/view/rootFlame.dart' as root;
import 'model/colorModeState.dart';
import 'model/routingState.dart';

void main() async {
  await DotEnv().load('.env'); // 追加
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("========MyApp build========");
    return MaterialApp(
      title: 'Inhouse',
      theme: inhouseThemeColor,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('ja')],
      locale: Locale('ja', 'JP'),
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
          // StateNotifierProvider<GetTagListService, TagList>(
          //   create: (context) => GetTagListService(),
          // ),
          // StateNotifierProvider<GetLocationListService, LocationList>(
          //   create: (context) => GetLocationListService(),
          // ),
          StateNotifierProvider<ChangeColorMode, ColorModeState>(
            create: (context) => ChangeColorMode(),
          ),
        ],
        child: root.RootFlame(),
      ),
    );
  }
}
