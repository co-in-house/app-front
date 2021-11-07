// header用button
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:inhouse/model/community/CommunityOverview.dart';
import 'package:inhouse/model/event/eventList.dart';
import 'package:inhouse/service/event/selectTimeService.dart';
import 'package:inhouse/util/util.dart';
import 'package:flutter/material.dart';
import 'package:inhouse/view/event/eventEditPage.dart';
import 'package:provider/provider.dart';

class HeaderButtonEditEvent extends StatelessWidget {
  const HeaderButtonEditEvent({
    Key key,
    @required this.eventInfo,
    @required this.selectedComm,
  }) : super(key: key);
  final OneEvent eventInfo;
  final CommunityOverview selectedComm;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Const.headerButtonContainerHeight,
      child: ElevatedButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MultiProvider(
                providers: [
                  StateNotifierProvider<SelectDateTimeService,
                      SelectDateTimeState>(
                    create: (context) => SelectDateTimeService(),
                  ),
                ],
                child: EventEditPage(
                  content: eventInfo,
                  fixedComm: selectedComm,
                ),
              ),
              fullscreenDialog: true,
            ),
          ),
        },
        child: Icon(Icons.edit, color: Colors.white),
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          shape: CircleBorder(),
          primary: Colors.green[400],
          onPrimary: Colors.green,
        ),
      ),
    );
  }
}
