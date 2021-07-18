import 'package:Inhouse/model/communityList.dart';
import 'package:Inhouse/model/eventList.dart';
import 'package:Inhouse/model/locationList.dart';
import 'package:Inhouse/model/lounge/roomState.dart';
import 'package:Inhouse/model/postList.dart';
import 'package:Inhouse/model/tagList.dart';
import 'package:Inhouse/service/api/getCommunityListService.dart';
import 'package:Inhouse/service/api/getEventListService.dart';
import 'package:Inhouse/service/api/getLocationListService.dart';
import 'package:Inhouse/service/api/getPostListService.dart';
import 'package:Inhouse/service/api/getTagListService.dart';
import 'package:Inhouse/service/changePage.dart';
import 'package:Inhouse/service/lounge/changeRoom.dart';
import 'package:Inhouse/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:Inhouse/view/rootFlame.dart' as root;
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
          StateNotifierProvider<GetEventListService, EventList>(
            create: (context) => GetEventListService(),
          ),
          StateNotifierProvider<GetPostListService, PostList>(
            create: (context) => GetPostListService(),
          ),
          StateNotifierProvider<GetCommunityListService, CommunityList>(
            create: (context) => GetCommunityListService(),
          ),
          //マスター取得
          StateNotifierProvider<GetTagListService, TagList>(
            create: (context) => GetTagListService(),
          ),
          StateNotifierProvider<GetLocationListService, LocationList>(
            create: (context) => GetLocationListService(),
          ),
        ],
        child: root.RootFlame(),
      ),
    );
  }
}
