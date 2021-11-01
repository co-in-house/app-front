import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:inhouse/component/common/dateTimeEditableContainer.dart';
import 'package:inhouse/component/common/editHeroImageContainer.dart';
import 'package:inhouse/mock/mock.dart';
import 'package:inhouse/model/event/eventList.dart';
import 'package:inhouse/util/dataQuery.dart';
import 'package:inhouse/util/util.dart';
import 'package:flutter/material.dart';

class EventEditDelegate extends SliverChildListDelegate {
  EventEditDelegate(
    BuildContext context,
    OneEvent content,
  ) : super(_EventEditRowList.build(context, content));
}

class _EventEditRowList {
  static TextEditingController _titleCtrl;
  static TextEditingController _titleErrorCtrl;
  static TextEditingController _startCtrl;
  static TextEditingController _endCtrl;
  static final Color _titleColor = Colors.black;
  static final Color _descriptionFontColor = Colors.grey;

  static void _handleTitle() {
    print(_titleCtrl.text);
  }

  static List<Widget> build(BuildContext context, OneEvent content) {
    _titleCtrl = new TextEditingController();
    _titleErrorCtrl = new TextEditingController();
    _startCtrl = new TextEditingController();
    _endCtrl = new TextEditingController();
    final double _horizontalPadding = MediaQuery.of(context).size.width *
        (1 - Const.containerWidthPercentage);
    final double _verticalRowMargin = _horizontalPadding / 3;
    final bool _isNew =
        (content == null || content.eventId == null || content.eventId == 0);
    if (!_isNew) {
      _titleCtrl.text = content.title;
    }

    List<Widget> list = [];
    // thumbnail image
    list.add(
      EditHeroImageContainer(
        networkImgUrl: _isNew ? null : content.thumbnailImg,
        assetImgPath: _isNew ? EventImageDataQuery.getDefaultImgRandom() : null,
      ),
    );
    // _titleErrorCtrl.text = "";
    // title
    list.add(
      Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: TextField(
          maxLines: 1,
          maxLength: 3,
          autocorrect: false,
          enabled: true,
          obscureText: false,
          controller: _titleCtrl,
          onChanged: (String s) => _handleTitle(),
          style: TextStyle(color: _titleColor),
          maxLengthEnforcement: MaxLengthEnforcement.none,
          decoration: InputDecoration(
            errorText: _titleErrorCtrl.text != "" ? _titleErrorCtrl.text : null,
            hintText: 'Title',
          ),
        ),
      ),
    );
    // start
    list.add(
      Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: DateTimeEditableContainer(
          label: "start",
          descriptionFontColor: _descriptionFontColor,
          minimumDate: DateTime.now(),
          dateTextCtrl: _startCtrl,
        ),
      ),
    );
    // start
    list.add(
      Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: DateTimeEditableContainer(
          label: "end",
          descriptionFontColor: _descriptionFontColor,
          minimumDate: DateTime.now(),
          dateTextCtrl: _endCtrl,
        ),
      ),
    );

    // // basic info container
    // list.add(
    //   EventDetailBasicInfoContainer(
    //     height: 35,
    //     horizontalPadding: _horizontalPadding,
    //     verticalRowMargin: _verticalRowMargin,
    //     descriptionFontColor: _descriptionFontColor,
    //   ),
    // );
    // description
    list.add(
      Container(
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        margin: EdgeInsets.symmetric(vertical: _verticalRowMargin),
        child: Text(
          Mock.longDescription,
          style: TextStyle(
            color: _descriptionFontColor,
          ),
        ),
      ),
    );
    return list;
  }
}
