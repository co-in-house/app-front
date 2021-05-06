import 'package:Inhouse/component/timeline/postCardRowList.dart';
import 'package:Inhouse/model/timeLine.dart';
import 'package:Inhouse/service/api/getTimeLineService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: MultiProvider(
            providers: [
              StateNotifierProvider<GetTimeLineService, TimeLine>(
                create: (context) => GetTimeLineService(),
              ),
            ],
            child: PostCardRowList(),
          ),
        ),
      ],
    );
  }
}
