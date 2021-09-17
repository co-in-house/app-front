import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';
import 'dart:math';

// SliverAppBar for Community Hero Image
class SliverAppBarCommunityDetail extends StatelessWidget {
  SliverAppBarCommunityDetail({
    @required this.id,
    @required this.imagePath,
    @required this.communityName,
    @required this.cheer,
    this.genreId,
  }) : super();
  final int id;
  final String imagePath;
  final String communityName;
  final int cheer;
  final int genreId;
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _SliverAppBarCommunityDetail(
        toolBarHeight: kToolbarHeight,
        openHeight: MediaQuery.of(context).size.width,
        closedHeight: MediaQuery.of(context).padding.top,
        id: this.id,
        imagePath: this.imagePath,
        communityName: this.communityName,
        cheer: this.cheer,
        genreId: this.genreId,
      ),
      floating: false,
      pinned: true,
    );
  }
}

class _SliverAppBarCommunityDetail extends SliverPersistentHeaderDelegate {
  double toolBarHeight;
  double closedHeight;
  double openHeight;
  int id;
  String imagePath;
  String communityName;
  int cheer;
  int genreId;

  _SliverAppBarCommunityDetail({
    this.toolBarHeight,
    this.closedHeight,
    this.openHeight,
    this.id,
    this.imagePath,
    this.communityName,
    this.cheer,
    this.genreId,
  });

  @override
  Widget build(_, double shrinkOffset, bool overlapsContent) {
    var shrinkPercentage =
        min(1, shrinkOffset / (maxExtent - minExtent)).toDouble();

    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          children: [
            Flexible(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    // color: inhouseThemeColor.appBarTheme.backgroundColor, //背景色
                    color: Colors.green[50], //背景色
                  ),
                  Opacity(
                    opacity: 1 - shrinkPercentage,
                    child: SizedBox(
                      height: MediaQuery.of(_).size.width,
                      width: MediaQuery.of(_).size.width,
                      child: Hero(
                        tag: '_heroNo' +
                            this.id.toString() +
                            this.genreId.toString(),
                        child: Image(
                          fit: BoxFit.cover,
                          alignment: FractionalOffset.topCenter,
                          image: Check.isUrlPath(this.imagePath)
                              ? NetworkImage(this.imagePath)
                              : AssetImage(this.imagePath),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    height: minExtent,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(_).padding.left,
                        right: MediaQuery.of(_).padding.right,
                        top: MediaQuery.of(_).padding.top,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(_);
                              },
                              child:
                                  Icon(Icons.arrow_back, color: Colors.black),
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                shape: CircleBorder(),
                                primary: Colors.white,
                                onPrimary: Colors.green,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Opacity(
                              opacity: shrinkPercentage,
                              child: Text(
                                this.communityName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                print("edit community!!!");
                              },
                              child: Icon(Icons.edit, color: Colors.black),
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                shape: CircleBorder(),
                                primary: Colors.white,
                                onPrimary: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: max(1 - shrinkPercentage * 4, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 100),
                        Text(
                          this.communityName,
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'Subtitle',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => openHeight;

  @override
  double get minExtent => toolBarHeight + closedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
