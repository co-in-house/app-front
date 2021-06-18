import 'dart:io';
import 'package:Inhouse/component/newCommunity/newCommunityBaseCard.dart';
import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewCommunityImageCard extends NewCommunityBaseCard {
  NewCommunityImageCard(this.newCommunityInfo);
  final NewCommunityInfo newCommunityInfo;
  ValueNotifier<PickedFile> _iconFie;

  Future getIconFromCamera() async {
    final PickedFile iconFile = await OsAccess.getImageFromCamera();
    if (iconFile != null) {
      newCommunityInfo.iconImg = File(iconFile.path);
    }
  }

  Future getIconFromGallery() async {
    final PickedFile iconFile = await OsAccess.getImageFromGallery();
    if (iconFile != null) {
      newCommunityInfo.iconImg = File(iconFile.path);
    }
  }

  Future getHeaderFromCamera() async {
    final PickedFile headerFile = await OsAccess.getImageFromCamera();
    if (headerFile != null) {
      newCommunityInfo.headerImg = File(headerFile.path);
    }
  }

  Future getHeaderFromGallery() async {
    final PickedFile headerFile = await OsAccess.getImageFromGallery();
    if (headerFile != null) {
      newCommunityInfo.headerImg = File(headerFile.path);
    }
  }

  @override
  Widget buildChild(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    getIconFromCamera();
                    this._iconFie =
                        newCommunityInfo.iconImg as ValueNotifier<PickedFile>;
                  },
                  // tooltip: 'Pick Image From Camera',
                  child: Icon(Icons.add_a_photo),
                ),
                ElevatedButton(
                  onPressed: getIconFromGallery,
                  // tooltip: 'Pick Image From Gallery',
                  child: Icon(Icons.photo_library),
                ),
                Container(
                  margin: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                  width: 180,
                  child: Text("アイコン選択"),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(0.0),
              alignment: Alignment.center,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  // fit: BoxFit.fill,
                  image: _iconFie == null
                      ? AssetImage('images/logo.png')
                      : AssetImage(newCommunityInfo.iconImg.path),
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: getHeaderFromCamera,
                  child: Icon(Icons.add_a_photo),
                ),
                ElevatedButton(
                  onPressed: getHeaderFromGallery,
                  child: Icon(Icons.photo_library),
                ),
                Container(
                  margin: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                  width: 180,
                  child: Text("ヘッダー選択"),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(0.0),
              alignment: Alignment.center,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: newCommunityInfo.headerImg == null
                      ? AssetImage('images/logo_w.png')
                      : AssetImage(newCommunityInfo.headerImg.path),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
