// SliverAppBar for Home
import 'package:Inhouse/service/user/userService.dart';
import 'package:Inhouse/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliverAppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Inhouse'),
      // automaticallyImplyLeading: false,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: inhouseThemeColor.primaryColor,
          fontSize: 20,
        ),
      ),
      iconTheme: IconThemeData(
        color: Theme.of(context).primaryColor,
      ),
      floating: true,
      pinned: true,
      snap: false,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 0),
          margin: EdgeInsets.symmetric(vertical: 4),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(
                color: Colors.grey,
                width: 0,
              ),
            ),
            elevation: 20.0,
            shadowColor: Colors.black,
            color: Colors.white,
            child: InkWell(
              onTap: () {
                print("InkWell");
                context.read<UserService>().logout();
              },
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'ログアウト機能',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      'テスト',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
