import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inhouse/util/modal.dart';
import 'package:inhouse/util/util.dart';

class EditHeroImageContainer extends StatefulWidget {
  const EditHeroImageContainer(
      {Key key, @required this.networkImgUrl, @required this.assetImgPath})
      : super(key: key);
  final String networkImgUrl;
  final String assetImgPath;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<EditHeroImageContainer> {
  final double _radius = 25;
  String targetImagePath;
  @override
  void initState() {
    super.initState();
    if (widget.assetImgPath != null) {
      targetImagePath = widget.assetImgPath;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 30.0,
      shadowColor: Colors.black,
      margin: EdgeInsets.only(
        top: 0,
        bottom: MediaQuery.of(context).size.width * 0.1,
        left: 0,
        right: 0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(_radius),
          bottomRight: Radius.circular(_radius),
        ),
      ),
      child: Container(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(_radius),
                  bottomRight: Radius.circular(_radius),
                ),
                image: DecorationImage(
                  alignment: Alignment(-.2, -.2),
                  image: widget.networkImgUrl == null
                      ? AssetImage(this.targetImagePath)
                      : NetworkImage(widget.networkImgUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                String rawImagepath =
                    await getLocalPhotoPathModal(context: context);
                if (rawImagepath != null) {
                  File croppedFile =
                      await OsAccess.cropImage(sourcePath: rawImagepath);
                  if (croppedFile != null && croppedFile.path.isNotEmpty) {
                    setState(() {
                      targetImagePath = croppedFile.path;
                    });
                  }
                }
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(_radius),
                    bottomRight: Radius.circular(_radius),
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: Const.headerButtonContainerHeight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        shape: CircleBorder(),
                        primary: Colors.black.withOpacity(0.5),
                        // onPrimary: Colors.green,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        String rawImagepath =
                            await getLocalPhotoPathModal(context: context);
                        if (rawImagepath != null) {
                          File croppedFile = await OsAccess.cropImage(
                              sourcePath: rawImagepath);
                          if (croppedFile != null &&
                              croppedFile.path.isNotEmpty) {
                            setState(() {
                              targetImagePath = croppedFile.path;
                            });
                          }
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
