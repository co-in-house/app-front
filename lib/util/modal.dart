import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:inhouse/component/event/common/commOverviewContainer.dart';
import 'package:inhouse/component/event/detail/AttendeeModalGridViewContainer.dart';
import 'package:inhouse/model/community/CommunityOverview.dart';
import 'package:inhouse/model/community/JoinedCommunity.dart';
import 'package:inhouse/util/inhouseWidget.dart';
import 'package:inhouse/util/theme.dart';
import 'package:inhouse/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// room modal
Future roomModal({BuildContext context, Widget content, double circular = 20}) {
  Future result = showModalBottomSheet(
    //モーダルの背景の色、透過
    backgroundColor: Colors.transparent,
    //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        // height: MediaQuery.of(context).size.height - kToolbarHeight,
        height: MediaQuery.of(context).size.height / 2,
        padding: EdgeInsets.symmetric(
          vertical: circular,
          //  horizontal: MediaQuery.of(context).size.width * 0.05, //横スクロールがあるから余白なし。
        ),
        margin: EdgeInsets.only(top: 1),
        decoration: BoxDecoration(
          //モーダル自体の色
          color: Colors.white,
          //角丸にする
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(circular),
            topRight: Radius.circular(circular),
          ),
        ),
        child: content,
      );
    },
  );
  return result;
}

// event join modal
Future eventJoinConfirmModal(BuildContext context) {
  Future result = showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Const.borderRadius),
        ),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // title
                Container(
                  child: Text(
                    "参加しましゅ！",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Robot",
                      height: 1.2,
                      fontSize: 20,
                    ),
                  ),
                ),
                // content
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "参加者一覧に追加されます",
                    style: TextStyle(
                      color: Colors.grey,
                      // fontWeight: FontWeight.bold,
                      fontFamily: "Robot",
                      height: 1.2,
                      // fontSize: 28,
                    ),
                  ),
                ),
                // action
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text("CLOSE"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text("JOIN"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[400],
                            // elevation: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );

  return result;
}

// event cancel modal
Future eventCancelConfirmModal(BuildContext context) {
  Future result = showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Const.borderRadius),
        ),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // title
                Container(
                  child: Text(
                    "やめちゃうぜ！",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Robot",
                      height: 1.2,
                      fontSize: 20,
                    ),
                  ),
                ),
                // content
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "参加者一覧から削除されます",
                    style: TextStyle(
                      color: Colors.grey,
                      // fontWeight: FontWeight.bold,
                      fontFamily: "Robot",
                      height: 1.2,
                      // fontSize: 28,
                    ),
                  ),
                ),
                // action
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text("CLOSE"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text("CANCEL"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[400],
                            // elevation: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );

  return result;
}

// event attendee  modal
Future attendeeModal({@required BuildContext context, double circular = 20}) {
  final Size _screenSize = MediaQuery.of(context).size;
  final Color _descriptionColor = Colors.grey;
  final double _horizontalPadding = _screenSize.width * 0.05;
  // final Attendees attendees =
  //     context.select((Attendees attendees) => attendees);
  Future result = showModalBottomSheet(
    //モーダルの背景の色、透過
    backgroundColor: Colors.transparent,
    //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return SizedBox.expand(
        child: DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.5,
          maxChildSize: 0.8,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              padding: EdgeInsets.symmetric(
                vertical: circular,
                horizontal: _horizontalPadding,
              ),
              decoration: BoxDecoration(
                //モーダル自体の色
                color: Colors.white,
                //角丸にする
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(circular),
                  topRight: Radius.circular(circular),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InhouseWidget.toggleContainer(),
                  Container(
                    child: Text(
                      "Member",
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.people,
                          color: _descriptionColor,
                        ),
                        Text(
                          "123人参加予定",
                          style: TextStyle(
                            color: _descriptionColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // attendees.isLoading
                  //     ? CircularProgressIndicator()
                  // :
                  AttendeeModalGridViewContainer(
                    scrollController: scrollController,
                    size: _screenSize.width - _horizontalPadding * 2,
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
  return result;
}

// custom date picker modal
Future<DateTime> datePickerModal(
    {@required BuildContext context,
    @required DateTime initialDateTime,
    double circular = 20}) {
  Future result = showModalBottomSheet<DateTime>(
    context: context,
    builder: (BuildContext context) {
      DateTime tempPickedDate;
      return Container(
        height: 250,
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CupertinoButton(
                    child: Text('キャンセル'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoButton(
                    child: Text('決定'),
                    onPressed: () {
                      Navigator.of(context).pop(tempPickedDate);
                    },
                  ),
                ],
              ),
            ),
            Divider(
              height: 0,
              thickness: 1,
            ),
            Expanded(
              child: Container(
                child: CupertinoDatePicker(
                  use24hFormat: true,
                  minuteInterval: 5,
                  initialDateTime: initialDateTime,
                  onDateTimeChanged: (DateTime dateTime) {
                    tempPickedDate = dateTime;
                  },
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
  return result;
}

// select community for event modal
Future<CommunityOverview> selectCommunityForEventModal(
    {@required BuildContext context,
    @required JoinedCommunityList joinedCommunityList,
    double circular = 20}) {
  final Size _screenSize = MediaQuery.of(context).size;
  Future<CommunityOverview> result = showModalBottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: _screenSize.height * 0.6,
        padding: EdgeInsets.symmetric(
          vertical: circular,
          horizontal: _screenSize.width * 0.025,
        ),
        margin: EdgeInsets.only(top: 1),
        decoration: BoxDecoration(
          color: inhouseThemeColor.backgroundColor, //モーダル自体の色
          borderRadius: BorderRadius.only(
            //角丸にする
            topLeft: Radius.circular(circular),
            topRight: Radius.circular(circular),
          ),
        ),
        child: Column(
          children: [
            InhouseWidget.toggleContainer(),
            Container(
              child: Text("主催コミュニティを選ぼう!"),
            ),
            Flexible(
              child: Scrollbar(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: joinedCommunityList.contentsList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      CommOverviewContainer(
                    commOverview: joinedCommunityList.contentsList[index],
                    doPop: true,
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
  return result;
}

// photo modal
Future<String> getLocalPhotoPathModal({@required BuildContext context}) {
  Future<String> result = showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) {
      return CupertinoActionSheet(
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: const Text('写真を撮影'),
            onPressed: () async {
              PickedFile iconFile = await OsAccess.getImageFromCamera();
              if (iconFile != null) {
                Navigator.pop(context, iconFile.path);
              }
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('アルバムから選択'),
            onPressed: () async {
              print("onPressed select 1");
              PickedFile iconFile = await OsAccess.getImageFromGallery();
              if (iconFile != null) {
                Navigator.pop(context, iconFile.path);
              }
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('キャンセル'),
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
    },
  );
  return result;
}
