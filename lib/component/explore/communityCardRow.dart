import 'package:inhouse/component/explore/communityCard.dart';
import 'package:inhouse/model/communityList.dart';
import 'package:flutter/material.dart';

class CommunityCardRow extends StatelessWidget {
  CommunityCardRow({@required this.communityList, this.genreId});
  final List<Community> communityList;
  final int genreId;
  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.width * 0.6;
    int itemCount = 0;
    if (communityList.length > 5) {
      itemCount = 5;
    } else {
      itemCount = communityList.length;
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.0),
      height: _height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return CommunityCard(
            content: communityList[index],
            width: _height,
            genreId: genreId,
            rankIndex: index + 1,
          );
        },
        itemCount: itemCount,
      ),
    );
  }
}
