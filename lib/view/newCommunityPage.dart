import 'dart:io';

import 'package:Inhouse/component/appBar.dart';
import 'package:Inhouse/component/newCommunity/newCommuityImageCard.dart';
import 'package:Inhouse/component/newCommunity/newCommunityContentCard.dart';
import 'package:Inhouse/component/newCommunity/newCommunityLocationCard.dart';
import 'package:Inhouse/component/newCommunity/newCommunityNameCard.dart';
import 'package:Inhouse/component/newCommunity/newCommunityRequirementCard.dart';
import 'package:Inhouse/component/newCommunity/newCommunityTagCard.dart';
import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:Inhouse/model/tagList.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewCommunityPage extends StatefulWidget {
  NewCommunityPage({Key key, this.newCommunityInfo}) : super(key: key);
  final NewCommunityInfo newCommunityInfo;

  @override
  _NewCommunityState createState() => _NewCommunityState();
}

class _NewCommunityState extends State<NewCommunityPage> {
  Text _submitLabel = Text("作成");
  double _pageNo = 0.0;
  File _icon;
  File _header;
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
      // NewCommunityImageCard(widget.newCommunityInfo),
    ];

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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => NewCommunityLocationPage(
                      //         newCommunityInfo: newCommunityInfo),
                      //   ),
                      // );
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
}
