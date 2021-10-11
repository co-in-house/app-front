import 'package:Inhouse/component/appBar/inhouseAppBar.dart';
import 'package:Inhouse/component/event/detail/eventDetailDelegate.dart';
import 'package:Inhouse/component/event/detail/headerButtonEdit.dart';
import 'package:Inhouse/component/event/detail/joinFloatingButtonContainer.dart';
import 'package:Inhouse/model/event/eventList.dart';
import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget {
  EventDetailPage({Key key, @required this.eventInfo}) : super(key: key);
  final OneCardOnEventList eventInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InhouseAppBar.build(context, [HeaderButtonEditEvent()]),
      floatingActionButton: JoinFloatingButton(),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(delegate: EventDetailDelegate(context, eventInfo)),
        ],
      ),
    );
  }
}
