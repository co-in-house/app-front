import 'package:inhouse/component/appBar/inhouseAppBar.dart';
import 'package:inhouse/component/event/detail/eventDetailDelegate.dart';
import 'package:inhouse/component/event/detail/headerButtonEdit.dart';
import 'package:inhouse/model/event/eventList.dart';
import 'package:inhouse/service/api/event/getAttendeesService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDetailPage extends StatelessWidget {
  EventDetailPage({Key key, @required this.eventInfo}) : super(key: key);
  final OneEvent eventInfo;
  @override
  Widget build(BuildContext context) {
    context.read<GetAttendeesService>().call();
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
            ),
          ),
        ],
      ),
    );
  }
}
