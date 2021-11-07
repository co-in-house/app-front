import 'package:inhouse/component/appBar/inhouseAppBar.dart';
import 'package:inhouse/component/event/detail/eventDetailDelegate.dart';
import 'package:inhouse/component/event/detail/headerButtonEdit.dart';
import 'package:inhouse/model/community/CommunityOverview.dart';
import 'package:inhouse/model/event/eventList.dart';
import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget {
  EventDetailPage(
      {Key key, @required this.eventInfo, @required this.selectedComm})
      : super(key: key);
  final OneEvent eventInfo;
  final CommunityOverview selectedComm;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InhouseAppBar.build(context, [HeaderButtonEditEvent()]),
      // floatingActionButton: JoinFloatingButton(),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: EventDetailDelegate(
              context,
              eventInfo,
              selectedComm,
            ),
          ),
        ],
      ),
    );
  }
}
