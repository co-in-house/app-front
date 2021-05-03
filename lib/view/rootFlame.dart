import 'package:Inhouse/component/appBar.dart';
import 'package:Inhouse/component/drawer.dart';
import 'package:Inhouse/model/sample.dart';
import 'package:Inhouse/service/sampleService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:Inhouse/view/homePage.dart';
import 'package:provider/provider.dart';

class RootFlame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(
        context: context,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: MultiProvider(
          providers: [
            StateNotifierProvider<SampleService, Sample>(
              create: (context) => SampleService(),
            ),
          ],
          child: MyHomePage(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Explore',
            icon: Icon(Icons.explore),
          ),
          BottomNavigationBarItem(
            label: 'Lounge',
            icon: Icon(Icons.apps),
          ),
          BottomNavigationBarItem(
            label: 'Event',
            icon: Icon(Icons.event_available),
          ),
          BottomNavigationBarItem(
            label: 'Message',
            icon: Icon(Icons.message_rounded),
          ),
        ],
      ),
    );
  }
}