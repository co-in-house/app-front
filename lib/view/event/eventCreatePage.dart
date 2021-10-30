import 'package:Inhouse/component/appBar/inhouseAppBar.dart';
import 'package:Inhouse/component/event/detail/headerButtonEdit.dart';
import 'package:flutter/material.dart';

class EventCreatePage extends StatefulWidget {
  EventCreatePage({Key key}) : super(key: key);

  @override
  _NewEventCreateState createState() => _NewEventCreateState();
}

class _NewEventCreateState extends State<EventCreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InhouseAppBar.build(context, [HeaderButtonEditEvent()]),
      // floatingActionButton:
      extendBodyBehindAppBar: true,
      body: Container(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: [], //SABNewEvent()],
        ),
      ),
    );
  }
}
