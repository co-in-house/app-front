import 'package:Inhouse/component/floatingButton.dart';
import 'package:Inhouse/component/navBar.dart';
import 'package:Inhouse/component/drawer.dart';
import 'package:Inhouse/model/routingState.dart';
import 'package:Inhouse/service/api/getLocationListService.dart';
import 'package:Inhouse/service/api/getTagListService.dart';
import 'package:Inhouse/util/wrapper.dart';
import 'package:Inhouse/view/eventPage.dart';
import 'package:Inhouse/view/explorePage.dart';
import 'package:Inhouse/view/loungePage.dart';
import 'package:Inhouse/view/messagePage.dart';
import 'package:flutter/material.dart';
import 'package:Inhouse/view/homePage.dart';
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
    return StatefulWrapper(
      onInit: () async {
        // master list 取得
        await context.read<GetTagListService>().call();
        await context.read<GetLocationListService>().call();
        print('Async Master List Load Done');
      },
      child: Scaffold(
          drawer: CustomDrawer(context: context),
          floatingActionButton: CustomFloatingButton(),
          bottomNavigationBar: CustomNavBar(),
          body: _contentView[
              context.select((RoutingState state) => state).routingState]),
    );
  }
}
