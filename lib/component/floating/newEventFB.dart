import 'dart:io';

import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:inhouse/model/community/JoinedCommunity.dart';
import 'package:inhouse/model/event/saveEventInfo.dart';
import 'package:inhouse/service/api/event/saveEventService.dart';
import 'package:inhouse/service/event/selectTimeService.dart';
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
      backgroundColor: const Color(0xFF3A7CD6),
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MultiProvider(
              providers: [
                StateNotifierProvider<SelectDateTimeService,
                    SelectDateTimeState>(
                  create: (context) => SelectDateTimeService(),
                ),
              ],
              child: EventEditPage(
                joinedCommunityList: jcl,
              ),
            ),
            fullscreenDialog: true,
          ),
        ).then(
          (result) => {
            if (result != null && result is SaveEventInfo)
              {
                _callBack(context, result),
              }
          },
        ),
      },
      child: Icon(Icons.add),
    );
  }

  void _callBack(BuildContext context, SaveEventInfo saveEventInfo) async {
    SaveEventService().save(context, saveEventInfo);
  }
}
