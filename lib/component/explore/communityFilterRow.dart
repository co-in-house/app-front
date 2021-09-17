import 'package:Inhouse/component/explore/communityFilterButton.dart';
import 'package:flutter/material.dart';

class CommunityFilterRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // スクロールの向きを水平方向に指定
      child: Row(
        children: [
          Column(children: [
            CommunityFilterButton(id: 1, label: '急上昇'),
            CommunityFilterButton(id: 2, label: 'スポーツ'),
          ]),
          Column(children: [
            CommunityFilterButton(id: 3, label: 'イベント企画運営'),
            CommunityFilterButton(id: 4, label: '文化活動'),
          ]),
          Column(children: [
            CommunityFilterButton(id: 5, label: '学生代表組織'),
            CommunityFilterButton(id: 6, label: '国際交流活動'),
          ]),
          Column(children: [
            CommunityFilterButton(id: 7, label: '音楽'),
            CommunityFilterButton(id: 8, label: '演劇'),
          ]),
          Column(children: [
            CommunityFilterButton(id: 9, label: 'ボランティア'),
            CommunityFilterButton(id: 10, label: '学問'),
          ]),
        ],
      ),
    );
  }
}
