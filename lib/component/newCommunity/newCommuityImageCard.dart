import 'dart:io';
import 'package:Inhouse/component/newCommunity/newCommunityBaseCard.dart';
import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewCommunityImageCard extends NewCommunityBaseCard {
  NewCommunityImageCard(
      this.newCommunityInfo,
      this._iconFromGallaryButton,
      this._iconFromCameraButton,
      this._headerFromCameraButton,
      this._headerFromGallaryButton);
  final NewCommunityInfo newCommunityInfo;
  final Widget _iconFromGallaryButton;
  final Widget _iconFromCameraButton;
  final Widget _headerFromCameraButton;
  final Widget _headerFromGallaryButton;

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
    print("icon : " + newCommunityInfo.iconImg.path.toString());
    print("header : " + newCommunityInfo.headerImg.path.toString());
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
                _iconFromCameraButton,
                _iconFromGallaryButton,
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
                  fit: BoxFit.contain,
                  image: AssetImage(newCommunityInfo.iconImg.path),
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
                _headerFromGallaryButton,
                _headerFromCameraButton,
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
                  image: AssetImage(newCommunityInfo.headerImg.path),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
