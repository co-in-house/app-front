import 'package:Inhouse/model/routingState.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// SliverAppBar for Home
class SliverAppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Inhouse'),
      // backgroundColor: Theme.of(context).primaryColor,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 20,
        ),
      ),
      iconTheme: IconThemeData(
        color: Theme.of(context).primaryColor,
      ),
      floating: true,
      pinned: true,
      // snap: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                decoration: new InputDecoration(
              suffixIcon:
                  new Icon(Icons.search, color: Theme.of(context).primaryColor),
              hintText: "fixed object",
            ))
          ],
        ),
      ),
    );
  }
}

// Custom
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final BuildContext context;
  CustomAppBar({Key key, this.context})
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
      return _AppBarComponent.home(widget.context);
    } else if (Const.routingNoExplore == rs) {
      print("explore");
      return _AppBarComponent.explore();
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

  static AppBar explore() {
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
