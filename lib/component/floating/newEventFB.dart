import 'package:inhouse/model/community/JoinedCommunity.dart';
import 'package:inhouse/view/event/eventEditPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// create new event floating button
class NewEventFB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var jcl = context.select((JoinedCommunityList jcl) => jcl);
    return FloatingActionButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventEdigPage(
              joinedCommunityList: jcl,
            ),
            fullscreenDialog: true,
          ),
        ),
      },
      child: Icon(Icons.add),
    );
  }
}
