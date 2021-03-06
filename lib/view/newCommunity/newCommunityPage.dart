import 'dart:io';

import 'package:inhouse/component/appBar/customAppBar.dart';
import 'package:inhouse/component/community/newCommunity/newCommuityImageCard.dart';
import 'package:inhouse/component/community/newCommunity/newCommunityContentCard.dart';
import 'package:inhouse/component/community/newCommunity/newCommunityLocationCard.dart';
import 'package:inhouse/component/community/newCommunity/newCommunityNameCard.dart';
import 'package:inhouse/component/community/newCommunity/newCommunityNoteCard.dart';
import 'package:inhouse/component/community/newCommunity/newCommunityRequirementCard.dart';
import 'package:inhouse/component/community/newCommunity/newCommunityTagCard.dart';
import 'package:inhouse/model/newCommunityInfo.dart';
import 'package:inhouse/model/tagList.dart';
import 'package:inhouse/service/api/postNewCommunityService.dart';
import 'package:inhouse/util/util.dart';
import 'package:inhouse/view/newCommunity/newCommunityConfirmPage.dart';
import 'package:flutter/cupertino.dart';
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
  final PageController _pageController = PageController(viewportFraction: 0.9);
  double _pageNo = 0.0;
  Text _submitLabel = Text("作成");
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nameErrorController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _requirementController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Widget> _contentList = [
      NewCommunityNameCard(this._nameController, this._nameErrorController),
      NewCommunityTagCard(this._getTagList(widget.newCommunityInfo.tagList)),
      NewCommunityLocationCard(
          this._locationController, widget.newCommunityInfo),
      NewCommunityContentCard(this._contentController),
      NewCommunityRequirementCard(this._requirementController),
      NewCommunityImageCard(
        widget.newCommunityInfo,
        this._iconButton(),
      ),
      NewCommunityNoteCard(this._noteController),
    ];

    if (widget.newCommunityInfo.iconImg == null) {
      widget.newCommunityInfo.iconImg = File('images/logo.png');
    }

    return Scaffold(
      appBar: CustomAppBar.newCommunity(context),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        // color: Colors.blue,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: PageView(
                    controller: _pageController,
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
                          widget.newCommunityInfo.name =
                              this._nameController.text;
                          widget.newCommunityInfo.content =
                              this._contentController.text;
                          widget.newCommunityInfo.requirement =
                              this._requirementController.text;
                          widget.newCommunityInfo.note =
                              this._noteController.text;
                          print(widget.newCommunityInfo);
                          if (_validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MultiProvider(
                                  providers: [
                                    StateNotifierProvider<
                                        PostNewCommunityService,
                                        NewCommunityInfo>(
                                      create: (context) =>
                                          PostNewCommunityService(),
                                    ),
                                  ],
                                  child: NewCommunityConfirmPage(
                                      newCommunityInfo:
                                          widget.newCommunityInfo),
                                ),
                              ),
                            );
                          }
                        },
                      )
                    : ElevatedButton(
                        child: _submitLabel,
                        style: ElevatedButton.styleFrom(elevation: 16),
                        onPressed: null),
              ],
            ),
          ),
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

  bool _validate() {
    print("validate");

    // 1 name
    // required
    if (this._nameController.text.isEmpty ||
        this._nameController.text.trim() == "") {
      this._nameErrorController.text = "Required";
      this._pageController.jumpToPage(0);
      return false;
    }

    return true;
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

  Widget _iconButton() {
    return ElevatedButton(
      // color: Colors.blue,
      // borderRadius: new BorderRadius.circular(0.0),
      onPressed: () {
        showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) {
              return CupertinoActionSheet(
                  actions: <Widget>[
                    CupertinoActionSheetAction(
                      child: const Text('写真を撮影'),
                      onPressed: () async {
                        final XFile iconFile =
                            await OsAccess.getImageFromCamera();
                        setState(() {
                          if (iconFile != null) {
                            widget.newCommunityInfo.iconImg =
                                File(iconFile.path);
                          }
                        });
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: const Text('アルバムから選択'),
                      onPressed: () async {
                        print("onPressed select 1");
                        final XFile iconFile =
                            await OsAccess.getImageFromGallery();
                        setState(() {
                          print("onPressed select 2");
                          if (iconFile != null) {
                            print("onPressed select 3");
                            widget.newCommunityInfo.iconImg =
                                File(iconFile.path);
                          }
                        });
                        print("onPressed select 4");
                        Navigator.pop(context);
                      },
                    ),
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    child: const Text('キャンセル'),
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ));
            });
      },
      child: Text('プロフィール画像を選択'),
    );
  }
}
