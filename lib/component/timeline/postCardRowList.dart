import 'package:Inhouse/component/timeline/postCardRow.dart';
import 'package:Inhouse/model/timeLine.dart';
import 'package:Inhouse/service/api/getTimeLineService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostCardRowList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PostCardRowListState();
}

class _PostCardRowListState extends State<PostCardRowList> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    // スクロールを検知したときに呼ばれる
    double positionRate =
        _scrollController.offset / _scrollController.position.maxScrollExtent;
    print("positionRate : " + positionRate.toString());
  }

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
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                return PostCardRow(row: timeLine.contentsList[index]);
              },
              itemCount: timeLine.contentsList.length,
            ),
    );
  }
}
