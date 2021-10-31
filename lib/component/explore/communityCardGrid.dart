// import 'package:inhouse/component/search/communityCard.dart';
// import 'package:inhouse/model/communityList.dart';
// import 'package:flutter/material.dart';

// class CommunityCardGrid extends SliverChildListDelegate {
//   CommunityCardGrid(CommunityList communityList)
//       : super(_CommunityList.buildCommunityList(communityList));
// }

// class _CommunityList {
//   static List<Widget> buildCommunityList(CommunityList communityList) {
//     print("buildCommunityList");
//     if (communityList.contentsList == null ||
//         communityList.contentsList.length == 0) {
//       return [Text("No Content")];
//     } else {
//       List<Widget> list = [];
//       // list.add(Hero(
//       //   child: Image.asset('images/hero.jpg'),
//       //   tag: 1,
//       // ));
//       list.add(Container(
//           margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//           child: Text(
//             "周辺エリアで検索",
//             style: TextStyle(
//               // backgroundColor: Colors.red,
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//             ),
//           )));
//       for (int index = 0; index < communityList.contentsList.length; index++) {
//         list.add(CommunityCard(content: communityList.contentsList[index]));
//       }
//       return list;
//     }
//   }
// }
