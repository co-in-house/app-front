import 'package:inhouse/component/appBar/inhouseAppBar.dart';
import 'package:inhouse/component/event/detail/headerButtonEdit.dart';
import 'package:flutter/material.dart';
import 'package:inhouse/component/event/edit/eventEditDelegate.dart';
import 'package:inhouse/model/event/eventList.dart';

class EventEdigPage extends StatefulWidget {
  EventEdigPage({Key key, this.content}) : super(key: key);
  final OneEvent content;
  @override
  _NewEventCreateState createState() => _NewEventCreateState();
}

class _NewEventCreateState extends State<EventEdigPage> {
  @override
  Widget build(BuildContext context) {
    // final bool isNew = (widget.content == null ||
    //     widget.content.eventId == null ||
    //     widget.content.eventId == 0);

    return Scaffold(
      appBar: InhouseAppBar.build(context, []),
      // floatingActionButton:
      extendBodyBehindAppBar: true,
      body: Container(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            SliverList(
              delegate: EventEditDelegate(
                context,
                widget.content,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
