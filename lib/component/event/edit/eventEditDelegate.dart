import 'package:flutter/cupertino.dart';
import 'package:inhouse/component/common/customLongTextField.dart';
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
    TextEditingController _selectedCommIdCtrl,
    TextEditingController _selectedCommNameCtrl,
    TextEditingController _selectedCommImgUrlCtrl,
    TextEditingController _selectedCommErrorCtrl,
    TextEditingController _assetImgPathCtrl,
    Key _longTextKey,
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
          _selectedCommIdCtrl,
          _selectedCommNameCtrl,
          _selectedCommImgUrlCtrl,
          _selectedCommErrorCtrl,
          _assetImgPathCtrl,
          _longTextKey,
        ));
}

class _EventEditRowList {
  static final Color _titleColor = Colors.black;
  static final Color _descriptionFontColor = Colors.grey;

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
    _selectedCommIdCtrl,
    _selectedCommNameCtrl,
    _selectedCommImgUrlCtrl,
    _selectedCommErrorCtrl,
    _assetImgPathCtrl,
    _longTextKey,
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
        assetImgPathCtrl: _assetImgPathCtrl,
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
              maxLine: 1,
              maxLength: 32,
              hintText: 'タイトルを追加',
              textColor: _titleColor,
              textCtrl: _titleCtrl,
              textErrorCtrl: _titleErrorCtrl,
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
            CustomTextField(
              maxLine: 1,
              maxLength: 50,
              hintText: '場所を追加',
              textColor: _descriptionFontColor,
              textCtrl: _locationCtrl,
              textErrorCtrl: _locationErrorCtrl,
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
          selectedCommIdCtrl: _selectedCommIdCtrl,
          selectedCommNameCtrl: _selectedCommNameCtrl,
          selectedCommImgUrlCtrl: _selectedCommImgUrlCtrl,
          selectedCommErrorCtrl: _selectedCommErrorCtrl,
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
        child: CustomLongTextField(
          textCtrl: _descriptionCtrl,
          key: _longTextKey,
        ),
      ),
    );

    // 余白調整
    list.add(Container(height: MediaQuery.of(context).padding.bottom * 4));
    return list;
  }
}
