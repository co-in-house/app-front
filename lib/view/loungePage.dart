import 'package:Inhouse/component/appBar.dart';
import 'package:Inhouse/component/lounge/communityLine.dart';
import 'package:Inhouse/model/lounge/roomState.dart';
import 'package:Inhouse/service/lounge/changeRoom.dart';
import 'package:Inhouse/util/util.dart';
import 'package:Inhouse/view/lounge/chatPage.dart';
import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:provider/provider.dart';

class LoungePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("========LoungePage build========");
    final int _roomIndex =
        context.select((RoomState roomState) => roomState).index;
    Const.miniplayerController.animateToHeight(state: PanelState.MAX);

    return Stack(children: [
      Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBarLounge(),
            SliverList(
              delegate: _LoungeDelegate(context),
            ),
          ],
        ),
      ),
      Offstage(
        offstage: _roomIndex == 0,
        child: Miniplayer(
          valueNotifier: Const.playerExpandProgress,
          // curve: Curves.easeInOut,
          controller: Const.miniplayerController,
          minHeight: Const.miniPlayerMinimumSize,
          maxHeight: MediaQuery.of(context).size.height,
          onDismiss: () {
            print("dismiss!!!");
          },
          builder: (height, percentage) {
            print(Const.playerExpandProgress.value.toString());
            if (_roomIndex == 0) return const SizedBox.shrink();
            if (percentage <= 0.5) {
              return Container(
                decoration: BoxDecoration(
                  gradient: CustomColor.linearGradient(_roomIndex),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => context.read<ChangeRoom>().set(0),
                    ),
                    Text('$height, $percentage'),
                  ],
                ),
              );
            }
            return ChatPage();
          },
        ),
      )
    ]);
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
