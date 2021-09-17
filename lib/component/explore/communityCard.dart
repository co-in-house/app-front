import 'package:Inhouse/component/explore/communityBadgeContainer.dart';
import 'package:Inhouse/component/text/tag.dart';
import 'package:Inhouse/model/communityList.dart';
import 'package:Inhouse/util/util.dart';
import 'package:Inhouse/view/community/communityDetialPage.dart';
import 'package:flutter/material.dart';

class CommunityCard extends StatelessWidget {
  final double width;
  final Community content;
  final int genreId;
  final int rankIndex;
  CommunityCard({
    @required this.content,
    @required this.width,
    @required this.rankIndex,
    this.genreId,
  });
  final double cardMarginVertical = 10.0;
  @override
  Widget build(BuildContext context) {
    print("content.profileImgUrl: " + content.profileImgUrl.toString());

    List<Widget> _tagList = [];
    if (content.tags.length > 0) {
      for (int index = 0; index < content.tags.length; index++) {
        _tagList.add(
          Flexible(child: TagWidget(label: content.tags[0].tagName)),
        );
      }
    }

    return Card(
      margin:
          EdgeInsets.symmetric(vertical: cardMarginVertical, horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Const.borderRadius),
      ),
      elevation: 3.0,
      child: InkWell(
        onTap: () {
          print("tapped! communityCard : " + content.toString());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CommunityDetailPage(
                community: content,
                genreId: genreId,
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          width: width - cardMarginVertical,
          // height: 200, // auto?
          alignment: Alignment.topCenter,

          child: Stack(
            children: [
              Positioned(
                  child: Hero(
                    tag: '_heroNo' +
                        content.communityId.toString() +
                        this.genreId.toString(),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(Const.borderRadius)),
                        image: DecorationImage(
                          image: content.profileImgUrl != null
                              ? NetworkImage(content.profileImgUrl)
                              : AssetImage("images/bg_f.jpg"),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ),
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0),
              Positioned(
                child: Container(
                  child: CommunityBadgeContainer(
                    rankIndex: this.rankIndex,
                    height: this.width, // 円
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: Const.borderRadius),
                  // decoration: BoxDecoration(
                  //   boxShadow: [
                  //     BoxShadow(
                  //       color: Colors.black26,
                  //       spreadRadius: 0.0,
                  //       blurRadius: 10.0,
                  //     ),
                  //   ],
                  // ),
                ),
                top: 0,
                left: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// Image.network(
//                               content.profileImgUrl,
//                               loadingBuilder: (BuildContext ctx, Widget child,
//                                   ImageChunkEvent loadingProgress) {
//                                 if (loadingProgress == null) {
//                                   return child;
//                                 } else {
//                                   return CircularProgressIndicator();
//                                 }
//                               },