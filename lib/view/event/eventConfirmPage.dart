import 'package:flutter/material.dart';
import 'package:inhouse/component/appBar/inhouseAppBar.dart';
import 'package:inhouse/component/event/confirm/eventConfirmDelegate.dart';
import 'package:inhouse/model/community/CommunityOverview.dart';

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
  }) : super(key: key);
  final String networkImgUrl;
  final String assetImgPath;
  final String title;
  final String start;
  final String end;
  final String location;
  final CommunityOverview selectedComm;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InhouseAppBar.build(context, []),
      extendBodyBehindAppBar: true,
      floatingActionButton: _submitFB(),
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

  Widget _submitFB() {
    return FloatingActionButton.extended(
        label: Text('作成'),
        icon: Icon(Icons.check),
        onPressed: () {
          print("hogehoge");
        });
  }
}
