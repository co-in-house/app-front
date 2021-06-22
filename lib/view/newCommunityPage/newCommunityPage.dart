import 'dart:io';

import 'package:Inhouse/component/appBar.dart';
import 'package:Inhouse/component/newCommunity/newCommuityImageCard.dart';
import 'package:Inhouse/component/newCommunity/newCommunityContentCard.dart';
import 'package:Inhouse/component/newCommunity/newCommunityLocationCard.dart';
import 'package:Inhouse/component/newCommunity/newCommunityNameCard.dart';
import 'package:Inhouse/component/newCommunity/newCommunityNoteCard.dart';
import 'package:Inhouse/component/newCommunity/newCommunityRequirementCard.dart';
import 'package:Inhouse/component/newCommunity/newCommunityTagCard.dart';
import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:Inhouse/model/tagList.dart';
import 'package:Inhouse/service/api/postNewCommunityService.dart';
import 'package:Inhouse/util/util.dart';
import 'package:Inhouse/view/newCommunityPage/testConfirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class NewCommunityPage extends StatefulWidget {
  NewCommunityPage({Key key, this.newCommunityInfo}) : super(key: key);
  final NewCommunityInfo newCommunityInfo;

  @override
  _NewCommunityState createState() => _NewCommunityState();
}

class _NewCommunityState extends State<NewCommunityPage> {
  Text _submitLabel = Text("作成");
  double _pageNo = 0.0;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _requirementController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Widget> _contentList = [
      NewCommunityNameCard(this._nameController),
      NewCommunityTagCard(this._getTagList(widget.newCommunityInfo.tagList)),
      NewCommunityLocationCard(
          this._locationController, widget.newCommunityInfo),
      NewCommunityContentCard(this._contentController),
      NewCommunityRequirementCard(this._requirementController),
      NewCommunityImageCard(
        widget.newCommunityInfo,
        this._iconFromGallaryButton(),
        this._iconFromCameraButton(),
        this._headerFromGallaryButton(),
        this._headerFromCameraButton(),
      ),
      NewCommunityNoteCard(this._noteController),
    ];

    if (widget.newCommunityInfo.iconImg == null) {
      widget.newCommunityInfo.iconImg = File('images/logo.png');
    }
    if (widget.newCommunityInfo.headerImg == null) {
      widget.newCommunityInfo.headerImg = File('images/logo_w.png');
    }

    return Scaffold(
      appBar: CustomAppBar.newCommunity(context),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: PageView(
                controller: PageController(viewportFraction: 0.9),
                onPageChanged: _onPageViewChange,
                children: _contentList,
              ),
            ),
            LinearProgressIndicator(
              value: this._pageNo == 0
                  ? 0.1
                  : this._pageNo / (_contentList.length - 1),
            ),
            this._pageNo == (_contentList.length - 1)
                ? ElevatedButton(
                    child: _submitLabel,
                    style: ElevatedButton.styleFrom(elevation: 16),
                    onPressed: () {
                      widget.newCommunityInfo.name = this._nameController.text;
                      widget.newCommunityInfo.content =
                          this._contentController.text;
                      widget.newCommunityInfo.requirement =
                          this._requirementController.text;
                      widget.newCommunityInfo.note = this._noteController.text;
                      print(widget.newCommunityInfo);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MultiProvider(
                            providers: [
                              StateNotifierProvider<PostNewCommunityService,
                                  NewCommunityInfo>(
                                create: (context) => PostNewCommunityService(),
                              ),
                            ],
                            child: TestConfirm(
                                newCommunityInfo: widget.newCommunityInfo),
                          ),
                        ),
                      );
                    },
                  )
                : ElevatedButton(
                    child: _submitLabel,
                    style: ElevatedButton.styleFrom(elevation: 16),
                    onPressed: null),
          ],
        ),
      ),
    );
  }

  _onPageViewChange(int page) {
    print("Current Page: " + page.toString());
    setState(() {
      _pageNo = page.toDouble();
    });
  }

  List<Widget> _getTagList(TagList tagList) {
    return List<ElevatedButton>.generate(
      tagList.contentsList.length,
      (int index) => ElevatedButton(
        child: Text(tagList.contentsList[index].label),
        style: tagList.contentsList[index].flag
            ? ElevatedButton.styleFrom(
                elevation: 16,
              )
            : ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                elevation: 16,
              ),
        onPressed: () {
          setState(() {
            tagList.contentsList[index].flag =
                !tagList.contentsList[index].flag;
          });
          print(tagList.contentsList[index].label +
              " : " +
              tagList.contentsList[index].flag.toString());
        },
      ),
    );
  }

  Widget _iconFromGallaryButton() {
    return ElevatedButton(
      // tooltip: 'Pick Image From Gallery',
      onPressed: () async {
        final PickedFile iconFile = await OsAccess.getImageFromGallery();
        setState(() {
          if (iconFile != null) {
            widget.newCommunityInfo.iconImg = File(iconFile.path);
          }
        });
      },
      child: Icon(Icons.photo_library),
    );
  }

  Widget _iconFromCameraButton() {
    return ElevatedButton(
      // tooltip: 'Pick Image From Camera',
      onPressed: () async {
        final PickedFile iconFile = await OsAccess.getImageFromCamera();
        setState(() {
          if (iconFile != null) {
            widget.newCommunityInfo.iconImg = File(iconFile.path);
          }
        });
      },
      child: Icon(Icons.add_a_photo),
    );
  }

  Widget _headerFromGallaryButton() {
    return ElevatedButton(
      // tooltip: 'Pick Image From Gallery',
      onPressed: () async {
        final PickedFile iconFile = await OsAccess.getImageFromGallery();
        setState(() {
          if (iconFile != null) {
            widget.newCommunityInfo.headerImg = File(iconFile.path);
          }
        });
      },
      child: Icon(Icons.photo_library),
    );
  }

  Widget _headerFromCameraButton() {
    return ElevatedButton(
      // tooltip: 'Pick Image From Camera',
      onPressed: () async {
        final PickedFile iconFile = await OsAccess.getImageFromCamera();
        setState(() {
          if (iconFile != null) {
            widget.newCommunityInfo.headerImg = File(iconFile.path);
          }
        });
      },
      child: Icon(Icons.add_a_photo),
    );
  }
}
