import 'package:Inhouse/component/appBar.dart';
import 'package:Inhouse/component/navBar.dart';
import 'package:Inhouse/component/drawer.dart';
import 'package:Inhouse/model/routingState.dart';
import 'package:Inhouse/model/sample.dart';
import 'package:Inhouse/service/api/sampleService.dart';
import 'package:Inhouse/view/eventPage.dart';
import 'package:Inhouse/view/explorePage.dart';
import 'package:Inhouse/view/loungePage.dart';
import 'package:Inhouse/view/messagePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
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
      appBar: CustomAppBar(),
      drawer: CustomDrawer(context: context),
      bottomNavigationBar: CustomNavBar(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: MultiProvider(
          providers: [
            StateNotifierProvider<SampleService, Sample>(
              create: (context) => SampleService(),
            ),
          ],
          child: _contentView[
              context.select((RoutingState state) => state).routingState],
        ),
      ),
    );
  }
}
