import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:inhouse/component/common/customTextField.dart';
import 'package:inhouse/component/common/dateTimeEditableContainer.dart';
import 'package:inhouse/component/common/editHeroImageContainer.dart';
import 'package:inhouse/component/event/edit/commSelectContainer.dart';
import 'package:inhouse/model/community/JoinedCommunity.dart';
import 'package:inhouse/model/event/eventList.dart';
import 'package:inhouse/service/event/selectTimeService.dart';
import 'package:inhouse/util/dataQuery.dart';
import 'package:inhouse/util/inhouseWidget.dart';
import 'package:inhouse/util/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventEditDelegate extends SliverChildListDelegate {
  EventEditDelegate(
    BuildContext context,
    OneEvent content,
    JoinedCommunityList joinedCommunityList,
    TextEditingController _titleCtrl,
    TextEditingController _titleErrorCtrl,
    TextEditingController _locationCtrl,
    TextEditingController _locationErrorCtrl,
    TextEditingController _descriptionCtrl,
    TextEditingController _descriptionErrorCtrl,
  ) : super(_EventEditRowList.build(
          context,
          content,
          joinedCommunityList,
          _titleCtrl,
          _titleErrorCtrl,
          _locationCtrl,
          _locationErrorCtrl,
          _descriptionCtrl,
          _descriptionErrorCtrl,
        ));
}

class _EventEditRowList {
  static final Color _titleColor = Colors.black;
  static final Color _descriptionFontColor = Colors.grey;
  static final int _titleMaxLength = 3;
  static int _titleNowLength = 0;

  static void _handleTitle(
      TextEditingController _titleCtrl, TextEditingController _titleErrorCtrl) {
    _titleNowLength = _titleCtrl.text.length;
    if (_titleMaxLength <= _titleCtrl.text.length) {
      print("object " + _titleCtrl.text);
      _titleErrorCtrl.text = "$_titleMaxLength文字以内にしてください。";
    } else {
      print("object " + _titleCtrl.text);
      _titleErrorCtrl.text = "";
    }
  }

  static void _handleLocation() {}

  static void _handleDescription() {}

  static List<Widget> build(
    BuildContext context,
    OneEvent content,
    JoinedCommunityList joinedCommunityList,
    _titleCtrl,
    _titleErrorCtrl,
    _locationCtrl,
    _locationErrorCtrl,
    _descriptionCtrl,
    _descriptionErrorCtrl,
  ) {
    SelectDateTimeState selectedDateTime = context
        .select((SelectDateTimeState selectedDateTime) => selectedDateTime);
    Size _screenSize = MediaQuery.of(context).size;
    final double _horizontalPadding = MediaQuery.of(context).size.width *
        (1 - Const.containerWidthPercentage);
    final bool _isNew =
        (content == null || content.eventId == null || content.eventId == 0);
    if (!_isNew) {
      _titleCtrl.text = content.title;
    } else {}

    List<Widget> list = [];
    // thumbnail image
    list.add(
      EditHeroImageContainer(
        networkImgUrl: _isNew ? null : content.thumbnailImg,
        assetImgPath: _isNew ? EventImageDataQuery.getDefaultImgRandom() : null,
      ),
    );

    // title
    list.add(
      Container(
        margin: EdgeInsets.only(top: _screenSize.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              maxLength: 5,
              maxLine: 1,
              hintText: 'タイトルを追加',
              textColor: _titleColor,
              textCtrl: _titleCtrl,
            ),
            // Flexible(
            //   child: TextField(
            //     maxLines: 1,
            //     maxLength: _titleMaxLength,
            //     autocorrect: false,
            //     enabled: true,
            //     obscureText: false,
            //     controller: _titleCtrl,
            //     onChanged: (String s) =>
            //         _handleTitle(_titleCtrl, _titleErrorCtrl),
            //     style: TextStyle(color: _titleColor),
            //     maxLengthEnforcement: MaxLengthEnforcement.none,
            //     decoration: InputDecoration(
            //       hintText: 'タイトルを追加',
            //       contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
            //       border: InputBorder.none,
            //       counterText: '',
            //       isDense: true,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
    list.add(
      Container(
        margin: EdgeInsets.only(top: _screenSize.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: InhouseWidget.dividerContainer(),
      ),
    );

    // start
    list.add(
      Container(
        margin: EdgeInsets.only(top: _screenSize.width * 0.05),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 30,
              child:
                  Icon(Icons.date_range_outlined, color: _descriptionFontColor),
              margin: EdgeInsets.only(right: 5),
            ),
            Flexible(
              child: DateTimeEditableContainer(
                label: "開始",
                descriptionFontColor: _descriptionFontColor,
                selectDateTime: selectedDateTime,
                isStart: true,
              ),
            ),
          ],
        ),
      ),
    );
    // end
    list.add(
      Container(
        margin: EdgeInsets.only(top: _screenSize.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: Row(
          children: [
            Container(
              width: 30,
              margin: EdgeInsets.only(right: 5),
            ),
            Flexible(
              child: DateTimeEditableContainer(
                label: "終了",
                descriptionFontColor: _descriptionFontColor,
                selectDateTime: selectedDateTime,
                isStart: false,
              ),
            ),
          ],
        ),
      ),
    );

    list.add(
      Container(
        margin: EdgeInsets.only(top: _screenSize.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: InhouseWidget.dividerContainer(),
      ),
    );
    // location
    list.add(
      Container(
        margin: EdgeInsets.only(top: _screenSize.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 30,
              child: Icon(Icons.location_on_outlined,
                  color: _descriptionFontColor),
              margin: EdgeInsets.only(right: 5),
            ),
            Flexible(
              child: TextField(
                maxLines: 1,
                maxLength: 50,
                autocorrect: false,
                enabled: true,
                obscureText: false,
                controller: _locationCtrl,
                onChanged: (String s) => _handleLocation(),
                style: TextStyle(
                  color: _descriptionFontColor,
                  fontSize: 15,
                ),
                maxLengthEnforcement: MaxLengthEnforcement.none,
                decoration: InputDecoration(
                  errorText: _locationErrorCtrl.text != ""
                      ? _locationErrorCtrl.text
                      : null,
                  hintText: '場所を追加',
                  contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                  border: InputBorder.none,
                  counterText: '',
                  isDense: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    list.add(
      Container(
        margin: EdgeInsets.only(top: _screenSize.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: InhouseWidget.dividerContainer(),
      ),
    );
    // select community
    list.add(
      Container(
        margin: EdgeInsets.only(top: _screenSize.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: CommSelectContainer(
          canTap: true,
          joinedCommunityList: joinedCommunityList,
        ),
      ),
    );
    list.add(
      Container(
        margin: EdgeInsets.only(top: _screenSize.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: InhouseWidget.dividerContainer(),
      ),
    );

    // description
    list.add(
      Container(
        margin: EdgeInsets.only(top: _screenSize.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: TextField(
                maxLines: null,
                maxLength: 500,
                autocorrect: false,
                enabled: true,
                obscureText: false,
                controller: _descriptionCtrl,
                onChanged: (String s) => _handleDescription(),
                style: TextStyle(color: _titleColor),
                maxLengthEnforcement: MaxLengthEnforcement.none,
                decoration: InputDecoration(
                  hintText: '詳細内容を追加する',
                  contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                  border: InputBorder.none,
                  counterText: '',
                  isDense: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // 余白調整
    list.add(Container(height: MediaQuery.of(context).padding.bottom * 2));
    return list;
  }
}
