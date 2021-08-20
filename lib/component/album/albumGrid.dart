import 'package:Inhouse/component/album/onePhotoPreviewContainer.dart';
import 'package:flutter/material.dart';

class AlbumListDelegate extends SliverChildListDelegate {
  AlbumListDelegate(BuildContext context, List<String> imgUrlList)
      : super(_AlbumListDelegate.build(context, imgUrlList));
  BuildContext context;
}

class _AlbumListDelegate {
  static List<Widget> build(BuildContext context, List<String> imgUrlList) {
    List<Widget> list = [];
    print('length' + (imgUrlList.length.toString()));
    if (imgUrlList != null && imgUrlList.isNotEmpty && imgUrlList.length > 0) {
      for (int index = 0; index < imgUrlList.length; index++) {
        list.add(OnePhotoPreviewContainer(url: imgUrlList[index]));
      }
    }
    return list;
  }
}
