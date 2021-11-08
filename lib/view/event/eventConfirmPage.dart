import 'package:flutter/material.dart';
import 'package:inhouse/component/appBar/inhouseAppBar.dart';
import 'package:inhouse/component/event/confirm/eventConfirmDelegate.dart';
import 'package:inhouse/model/community/CommunityOverview.dart';
import 'package:inhouse/model/event/saveEventInfo.dart';
import 'package:inhouse/service/api/event/saveEventService.dart';

class EventConfirmPage extends StatelessWidget {
  const EventConfirmPage({
    Key key,
    @required this.networkImgUrl,
    @required this.assetImgPath,
    @required this.title,
    @required this.start,
    @required this.end,
    @required this.location,
    @required this.selectedComm,
    this.description,
    this.eventId,
  }) : super(key: key);
  final String networkImgUrl;
  final String assetImgPath;
  final String title;
  final String start;
  final String end;
  final String location;
  final CommunityOverview selectedComm;
  final String description;
  final int eventId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InhouseAppBar.build(context, []),
      extendBodyBehindAppBar: true,
      floatingActionButton: _submitFB(context),
      body: Container(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            SliverList(
              delegate: EventConfirmDelegate(
                context: context,
                networkImgUrl: this.networkImgUrl,
                assetImgPath: this.assetImgPath,
                title: this.title,
                start: this.start,
                end: this.end,
                location: this.location,
                selectedComm: this.selectedComm,
                description: this.description,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _submitFB(BuildContext context) {
    return FloatingActionButton.extended(
        backgroundColor: const Color(0xFF3A7CD6),
        label: Text('作成'),
        icon: Icon(Icons.check),
        onPressed: () async {
          SaveEventInfo saveEventInfo = SaveEventInfo(
            eventId: this.eventId,
            communityId: this.selectedComm.communityId,
            targetImgPath: this.assetImgPath,
            iconImgUrl: this.networkImgUrl,
            title: this.title,
            start: this.start,
            end: this.end,
            location: this.location,
            description: this.description,
          );
          if (eventId != null) {
            saveEventInfo.eventId = eventId;
          }

          Navigator.pop(context, saveEventInfo);
        });
  }
}
