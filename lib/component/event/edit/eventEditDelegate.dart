import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:inhouse/component/common/dateTimeEditableContainer.dart';
import 'package:inhouse/component/common/editHeroImageContainer.dart';
import 'package:inhouse/model/event/eventList.dart';
import 'package:inhouse/util/dataQuery.dart';
import 'package:inhouse/util/format.dart';
import 'package:inhouse/util/modal.dart';
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
  static TextEditingController _descriptionCtrl;
  static TextEditingController _startCtrl;
  static TextEditingController _endCtrl;
  static TextEditingController _locationCtrl;
  static TextEditingController _locationErrorCtrl;
  static final Color _titleColor = Colors.black;
  static final Color _descriptionFontColor = Colors.grey;

  static void _handleTitle() {}

  static void _handleLocation() {}

  static void _handleDescription() {}

  static List<Widget> build(BuildContext context, OneEvent content) {
    final DateTime _targetNow = DatetimeUtil.getInitialTargetDateTime();
    Size _screenSize = MediaQuery.of(context).size;
    _titleCtrl = new TextEditingController();
    _titleErrorCtrl = new TextEditingController();
    _locationCtrl = new TextEditingController();
    _locationErrorCtrl = new TextEditingController();
    _descriptionCtrl = new TextEditingController();
    _startCtrl = new TextEditingController(text: _targetNow.toString());
    _endCtrl = new TextEditingController(
        text: _targetNow.add(Duration(hours: 2)).toString());
    final double _horizontalPadding = MediaQuery.of(context).size.width *
        (1 - Const.containerWidthPercentage);
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

    // title
    list.add(
      Container(
        margin: EdgeInsets.only(top: _screenSize.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container(
            //   width: 0,
            //   margin: EdgeInsets.only(right: 5),
            // ),
            Flexible(
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
                  hintText: 'タイトルを追加',
                  errorText:
                      _titleErrorCtrl.text != "" ? _titleErrorCtrl.text : null,
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
        child: Divider(color: _descriptionFontColor),
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
                dateTextCtrl: _startCtrl,
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
                dateTextCtrl: _endCtrl,
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
        child: Divider(color: _descriptionFontColor),
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
        child: Divider(color: _descriptionFontColor),
      ),
    );
    // select community
    list.add(
      Container(
        margin: EdgeInsets.only(top: _screenSize.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: InkWell(
          onTap: () async {
            var result = await selectCommunityForEventModal(context: context);
          },
          child: Container(
            alignment: Alignment.centerLeft,
            height: 80,
            padding: EdgeInsets.all(25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 30),
                Text(
                  "主催コミュニティを追加する",
                  style: TextStyle(color: _descriptionFontColor),
                ),
                Icon(Icons.add, color: Colors.green),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Colors.grey[300],
            ),
          ),
        ),
      ),
    );
    list.add(
      Container(
        margin: EdgeInsets.only(top: _screenSize.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: Divider(color: _descriptionFontColor),
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
    list.add(Container(height: MediaQuery.of(context).padding.bottom * 2));
    return list;
  }
}
