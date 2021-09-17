// SliverAppBar for Album
import 'package:flutter/material.dart';

class SliverAppBarAlbum extends StatelessWidget {
  SliverAppBarAlbum({
    @required this.communityName,
    @required this.albumName,
  }) : super();
  final String communityName;
  final String albumName;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: false,
      pinned: true,
      delegate: _SliverAppBarAlbumDelegate(
        toolBarHeight: kToolbarHeight + MediaQuery.of(context).padding.top,
        communityName: this.communityName,
        albumName: this.albumName,
      ),
    );
  }
}

class _SliverAppBarAlbumDelegate extends SliverPersistentHeaderDelegate {
  double toolBarHeight;
  String communityName;
  String albumName;

  _SliverAppBarAlbumDelegate({
    this.toolBarHeight,
    this.communityName,
    this.albumName,
  });

  @override
  Widget build(_, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.green[50], // 背景色
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
                      child: Icon(Icons.arrow_back, color: Colors.black),
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        shape: CircleBorder(),
                        primary: Colors.white,
                        onPrimary: Colors.green,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          this.communityName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        Text(
                          this.albumName,
                          style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        print("album option");
                      },
                      child: Icon(Icons.more_horiz, color: Colors.black),
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
        ],
      ),
    );
  }

  @override
  double get maxExtent => toolBarHeight; // minで固定

  @override
  double get minExtent => toolBarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
