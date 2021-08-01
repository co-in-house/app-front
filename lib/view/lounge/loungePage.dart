import 'package:Inhouse/component/appBar.dart';
import 'package:Inhouse/component/lounge/communityLine.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';

class LoungePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("========LoungePage build========");

    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBarLounge(),
          SliverList(
            delegate: _LoungeDelegate(context),
          ),
        ],
      ),
    );
  }
}

class _LoungeDelegate extends SliverChildListDelegate {
  _LoungeDelegate(BuildContext context) : super(_Lounge.build(context));
  BuildContext context;
}

class _Lounge {
  static List<Widget> build(BuildContext context) {
    List<Widget> list = [];
    list.add(Container(child: Text('ラウンジ', style: TextStyle(fontSize: 32))));
    list.add(Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Divider(color: Colors.black)));
    list.add(Container(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 0),
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Text('まだ何も実装していません。', style: TextStyle(fontSize: 20))));
    list.add(Container(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 0),
        margin: EdgeInsets.symmetric(vertical: 40),
        child: Text(
          '今後の実装に期待しましょう。検索中に見つけたお気に入りの宿泊先やアクティビティは、ハートのアイコンをタップすることでこちらに保存できます。（Airbnbより引用）',
        )));

    list.add(CommunityLine(communityName: "Inhouse"));
    list.add(CommunityLine(communityName: "NTT"));
    list.add(CommunityLine(communityName: "軽音楽同好会"));
    list.add(CommunityLine(communityName: "ジョジョの奇妙な冒険"));
    list.add(
        CommunityLine(communityName: "俺は人間をやめるぞ同好会俺は人間をやめるぞ同好会俺は人間をやめるぞ同好会"));
    list.add(CommunityLine(communityName: "軽音楽同好会"));
    list.add(
        Padding(padding: EdgeInsets.only(bottom: Const.miniPlayerMinimumSize)));

    return list;
  }
}
