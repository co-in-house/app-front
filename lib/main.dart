import 'package:Inhouse/model/communityList.dart';
import 'package:Inhouse/model/eventList.dart';
import 'package:Inhouse/model/postList.dart';
import 'package:Inhouse/service/api/getCommunityListService.dart';
import 'package:Inhouse/service/api/getEventListService.dart';
import 'package:Inhouse/service/api/getPostListService.dart';
import 'package:Inhouse/service/changePage.dart';
import 'package:Inhouse/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import './view/rootFlame.dart' as root;
import 'model/routingState.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inhouse',
      theme: inhouseThemeColor,
      home: MultiProvider(
        providers: [
          StateNotifierProvider<ChangePage, RoutingState>(
            create: (context) => ChangePage(),
          ),
          StateNotifierProvider<GetEventListService, EventList>(
            create: (context) => GetEventListService(),
          ),
          StateNotifierProvider<GetPostListService, PostList>(
            create: (context) => GetPostListService(),
          ),
          StateNotifierProvider<GetCommunityListService, CommunityList>(
            create: (context) => GetCommunityListService(),
          ),
        ],
        child: root.RootFlame(),
      ),
    );
  }
}
