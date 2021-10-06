import 'package:Inhouse/component/appBar/sliverAppBarEventDetail.dart';
import 'package:Inhouse/component/event/joinFloatingButtonContainer.dart';
import 'package:Inhouse/model/eventList.dart';
import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget {
  EventDetailPage({Key key, @required this.eventInfo}) : super(key: key);
  final OneCardOnEventList eventInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar.newCommunityDetail(context),
      // extendBodyBehindAppBar: true,
      floatingActionButton: JoinFloatingButton(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBarEventDetail(eventInfo: eventInfo),
          SliverList(delegate: _EventDetailDelegate(context)),
        ],
      ),
    );
  }
}

class _EventDetailDelegate extends SliverChildListDelegate {
  _EventDetailDelegate(BuildContext context)
      : super(_EventDetailRowList.build(context));
  BuildContext context;
}

class _EventDetailRowList {
  static List<Widget> build(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < 200; i++) {
      list.add(Text("hogehoge party!"));
    }
    return list;
  }
}
