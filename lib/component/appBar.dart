import 'package:Inhouse/model/routingState.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Custom
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    int rs = context.select((RoutingState state) => state).routingState;
    if (Const.routingNoHome == rs) {
      print("home");
      return _AppBarComponent.home(context);
    } else if (Const.routingNoSearch == rs) {
      print("search");
      return _AppBarComponent.search();
    } else if (Const.routingNoLounge == rs) {
      print("lounge");
      return _AppBarComponent.lounge();
    } else if (Const.routingNoEvent == rs) {
      print("event");
      return _AppBarComponent.event();
    } else if (Const.routingNoMessage == rs) {
      print("message");
      return _AppBarComponent.message();
    } else {
      print("routingState is Other : " + rs.toString());
      return _AppBarComponent.home(context);
    }
  }
}

class _AppBarComponent {
  // for Home
  static AppBar home(BuildContext context) {
    return AppBar(
      title: Text("Inhouse"),
    );
  }

  static AppBar search() {
    return AppBar(
      title: TextField(
        onChanged: (text) {},
        decoration: new InputDecoration(
          suffixIcon: new Icon(Icons.search, color: Colors.white),
          // prefixIcon: new Icon(Icons.search, color: Colors.white),
          hintText: "Search something...",
        ),
      ),
    );
  }

  static AppBar lounge() {
    return AppBar(
      title: Text("Lounge"),
    );
  }

  static AppBar event() {
    return AppBar(
      title: Text("Event"),
    );
  }

  static AppBar message() {
    return AppBar(
      title: Text("Message"),
    );
  }
}
