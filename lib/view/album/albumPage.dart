import 'package:Inhouse/component/album/albumGrid.dart';
import 'package:Inhouse/component/appBar.dart';
import 'package:Inhouse/model/album.dart';
import 'package:flutter/material.dart';

class AlbumPage extends StatelessWidget {
  AlbumPage({Key key, @required this.album}) : super(key: key);
  final OneAlbum album;
  final double _spacingWidth = 2.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50], // 背景色
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBarAlbum(
            communityName: album.communityName,
            albumName: album.albumName,
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width / 3,
              mainAxisSpacing: _spacingWidth,
              crossAxisSpacing: _spacingWidth,
              childAspectRatio: 1.0,
            ),
            delegate: AlbumListDelegate(context, album.imgUrlList),
          ),
        ],
      ),
    );
  }
}
