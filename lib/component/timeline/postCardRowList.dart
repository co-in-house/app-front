import 'package:Inhouse/component/timeline/postCardRow.dart';
import 'package:Inhouse/model/timeLine.dart';
import 'package:Inhouse/service/api/getTimeLineService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostCardRowList extends StatelessWidget {
  final TimeLine timeLine;
  PostCardRowList({this.timeLine});

  @override
  Widget build(BuildContext context) {
    var timeLine = context.select((TimeLine timeLine) => timeLine);
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<GetTimeLineService>().call();
      },
      child: (timeLine.contentsList == null)
          ? ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Text("No Content");
              },
              itemCount: 1,
            )
          : ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return PostCardRow(row: timeLine.contentsList[index]);
              },
              itemCount: timeLine.contentsList.length,
            ),
    );
  }
}
