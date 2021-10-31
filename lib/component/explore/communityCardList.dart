import 'package:inhouse/component/explore/communityCardRow.dart';
import 'package:inhouse/model/communityList.dart';
import 'package:flutter/material.dart';

class CommunityCardList extends SliverChildListDelegate {
  CommunityCardList(CommunityList communityList)
      : super(_CommunityList.buildCommunityList(communityList));
}

class _CommunityList {
  static List<Widget> buildCommunityList(CommunityList communityList) {
    print("buildCommunityList");
    if (communityList.contentsList == null ||
        communityList.contentsList.length == 0) {
      return [Text("No Content")];
    } else {
      List<Widget> list = [];
      list.add(CommunityRowTitleContainer(label: '急上昇'));
      list.add(CommunityCardRow(
        communityList: communityList.contentsList,
        genreId: 1,
      ));
      list.add(CommunityRowTitleContainer(label: 'スポーツ'));
      list.add(CommunityCardRow(
        communityList: communityList.contentsList,
        genreId: 2,
      ));
      list.add(CommunityRowTitleContainer(label: '音楽'));
      list.add(CommunityCardRow(
        communityList: communityList.contentsList,
        genreId: 3,
      ));
      list.add(CommunityRowTitleContainer(label: '文化活動'));
      list.add(CommunityCardRow(
        communityList: communityList.contentsList,
        genreId: 4,
      ));
      list.add(CommunityRowTitleContainer(label: 'ダンス'));
      list.add(CommunityCardRow(
        communityList: communityList.contentsList,
        genreId: 5,
      ));
      // list.add(CommunityFilterRow());
      // list.add(Container(
      //     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      //     child: Text(
      //       "ランキング",
      //       style: TextStyle(
      //         // backgroundColor: Colors.red,
      //         fontWeight: FontWeight.bold,
      //         fontSize: 20,
      //       ),
      //     )));
      // for (int index = 0; index < communityList.contentsList.length; index++) {
      //   list.add(CommunityCard(content: communityList.contentsList[index]));
      // }
      return list;
    }
  }
}

class CommunityRowTitleContainer extends StatelessWidget {
  const CommunityRowTitleContainer({Key key, @required this.label})
      : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text(
          this.label,
          style: TextStyle(
            // backgroundColor: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ));
  }
}
