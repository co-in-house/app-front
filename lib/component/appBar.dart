import 'package:flutter/material.dart';

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
    // int rs = context
    //     .select((RootingState rootingState) => rootingState)
    //     .rootingState;
    // if (RootingState.isHome(rs)) {
    //   print("home");
    //   return _AppBarComponent.home(context);
    // } else if (RootingState.isSearch(rs)) {
    //   print("search");
    //   return _AppBarComponent.search();
    // } else {
    //   print("other");
    //   print("RootingState is " + rs.toString());
    //   return _AppBarComponent.home(context);
    // }
    return _AppBarComponent.home(context);
  }
}

class _AppBarComponent {
  // for Home
  static AppBar home(BuildContext context) {
    return AppBar(
      title: Text("Inhouse"),
      // actions: [
      //   IconButton(
      //     icon: Icon(Icons.search),
      //     onPressed: () {
      //       print("push!");
      //       context.read<ChangePage>().setSearch();
      //     },
      //   )
      // ],
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
}
