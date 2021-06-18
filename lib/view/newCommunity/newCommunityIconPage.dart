import 'dart:io';
import 'package:Inhouse/component/appBar.dart';
import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:Inhouse/util/util.dart';
import 'package:Inhouse/view/newCommunity/newCommunityNotePage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewCommunityIconPage extends StatefulWidget {
  NewCommunityIconPage({Key key, this.newCommunityInfo}) : super(key: key);
  final NewCommunityInfo newCommunityInfo;
  @override
  _NewCommunityIconState createState() => _NewCommunityIconState();
}

class _NewCommunityIconState extends State<NewCommunityIconPage> {
  File _icon;
  File _header;

  Future getIconFromCamera() async {
    final PickedFile iconFile = await OsAccess.getImageFromCamera();
    setState(() {
      if (iconFile != null) {
        _icon = File(iconFile.path);
      }
    });
  }

  Future getIconFromGallery() async {
    final PickedFile iconFile = await OsAccess.getImageFromGallery();
    setState(() {
      if (iconFile != null) {
        _icon = File(iconFile.path);
      }
    });
  }

  Future getHeaderFromCamera() async {
    final PickedFile headerFile = await OsAccess.getImageFromCamera();
    setState(() {
      if (headerFile != null) {
        _header = File(headerFile.path);
        widget.newCommunityInfo.iconImg = _icon;
      }
    });
  }

  Future getHeaderFromGallery() async {
    final PickedFile headerFile = await OsAccess.getImageFromGallery();
    setState(() {
      if (headerFile != null) {
        _header = File(headerFile.path);
        widget.newCommunityInfo.headerImg = _header;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.newCommunity(context),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width *
              Const.containerWidthPercentage,
          child: Column(
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
                        onPressed: getIconFromCamera,
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
                        width: 200,
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
                        image: _icon == null
                            ? AssetImage('images/logo.png')
                            : AssetImage(_icon.path),
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
                        width: 200,
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
                        image: _header == null
                            ? AssetImage('images/logo_w.png')
                            : AssetImage(_header.path),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: Text("次へ"),
                    style: ElevatedButton.styleFrom(
                      elevation: 16,
                    ),
                    onPressed: () {
                      print(widget.newCommunityInfo);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewCommunityNotePage(
                              newCommunityInfo: widget.newCommunityInfo),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
