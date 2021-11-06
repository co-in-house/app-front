import 'package:inhouse/component/appBar/inhouseAppBar.dart';
import 'package:flutter/material.dart';
import 'package:inhouse/component/event/edit/eventEditDelegate.dart';
import 'package:inhouse/component/floating/confirmEventFB.dart';
import 'package:inhouse/model/community/JoinedCommunity.dart';
import 'package:inhouse/model/event/eventList.dart';

class EventEdigPage extends StatefulWidget {
  EventEdigPage({Key key, this.content, this.joinedCommunityList})
      : super(key: key);
  final OneEvent content;
  final JoinedCommunityList joinedCommunityList;
  @override
  _NewEventCreateState createState() => _NewEventCreateState();
}

class _NewEventCreateState extends State<EventEdigPage> {
  TextEditingController _titleCtrl = TextEditingController();
  TextEditingController _titleErrorCtrl = TextEditingController();
  TextEditingController _locationCtrl = TextEditingController();
  TextEditingController _locationErrorCtrl = TextEditingController();
  TextEditingController _descriptionCtrl = TextEditingController();
  TextEditingController _descriptionErrorCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InhouseAppBar.build(context, []),
      floatingActionButton: ConfirmEventFB(),
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
                widget.joinedCommunityList,
                _titleCtrl,
                _titleErrorCtrl,
                _locationCtrl,
                _locationErrorCtrl,
                _descriptionCtrl,
                _descriptionErrorCtrl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
