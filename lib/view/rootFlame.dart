import 'package:Inhouse/component/floatingButton.dart';
import 'package:Inhouse/component/navBar.dart';
import 'package:Inhouse/component/drawer.dart';
import 'package:Inhouse/model/routingState.dart';
import 'package:Inhouse/view/eventPage.dart';
import 'package:Inhouse/view/explorePage.dart';
import 'package:Inhouse/view/loungePage.dart';
import 'package:Inhouse/view/messagePage.dart';
import 'package:flutter/material.dart';
import 'package:Inhouse/view/homePage.dart';
import 'package:provider/provider.dart';

class RootFlame extends StatelessWidget {
  final List<Widget> _contentView = <Widget>[
    HomePage(),
    ExplorePage(),
    LoungePage(),
    EventPage(),
    MessagePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context: context),
      floatingActionButton: CustomFloatingButton(),
      bottomNavigationBar: CustomNavBar(),
      body: _contentView[
          context.select((RoutingState state) => state).routingState],
    );
  }
}
