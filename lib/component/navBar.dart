import 'package:Inhouse/model/routingState.dart';
import 'package:Inhouse/service/changePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      currentIndex: context.select((RoutingState state) => state).routingState,
      onTap: (index) {
        context.read<ChangePage>().set(index);
      },
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
    );
  }
}
