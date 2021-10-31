import 'package:inhouse/model/baseModel.dart';
import 'package:flutter/material.dart';

@immutable
class AlbumList extends BaseModel {
  AlbumList({
    this.contentsList, // 初期値null
    this.isLoading = false,
  });
  final List<OneAlbum> contentsList;
  final bool isLoading;
}

class OneAlbum {
  OneAlbum({
    this.communityName,
    this.albumName,
    this.imgUrlList,
  });
  String communityName;
  String albumName;
  List<String> imgUrlList;
}
