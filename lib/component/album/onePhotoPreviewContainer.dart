import 'package:Inhouse/view/photo/photoViewPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnePhotoPreviewContainer extends StatelessWidget {
  const OnePhotoPreviewContainer({
    @required this.urlList,
    @required this.currentIndex,
  });
  final List<String> urlList;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => PhotoViewPage(
              galleryItems: urlList,
              initialIndex: currentIndex,
            ),
          ),
        );
      },
      child: Hero(
        tag: "_heroNo_album_" + currentIndex.toString(),
        child: Container(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Image.network(
              urlList[currentIndex],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
