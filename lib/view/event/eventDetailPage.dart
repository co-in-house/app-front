import 'package:Inhouse/component/appBar/sliverAppBarEventDetail.dart';
import 'package:Inhouse/component/event/joinFloatingButtonContainer.dart';
import 'package:Inhouse/model/eventList.dart';
import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget {
  EventDetailPage({Key key, @required this.eventInfo}) : super(key: key);
  final OneCardOnEventList eventInfo;
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SliverAppBarEventDetail2().build(context, scrollController),
      floatingActionButton: JoinFloatingButton(),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
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
      list.add(Text("hogehoge party! $i"));
    }
    return list;
  }
}
