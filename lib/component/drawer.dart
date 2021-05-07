import 'package:flutter/material.dart';

class CustomDrawer extends Drawer {
  CustomDrawer({BuildContext context})
      : super(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header',
                    style: Theme.of(context).primaryTextTheme.headline6),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              ListTile(
                title: Text('Item AAA'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item BBB'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
}
