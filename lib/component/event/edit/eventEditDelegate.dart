import 'package:inhouse/component/common/detailHeroImageContainer.dart';
import 'package:inhouse/component/common/editHeroImageContainer.dart';
import 'package:inhouse/component/event/detail/eventDetailBasicInfoContainer.dart';
import 'package:inhouse/mock/mock.dart';
import 'package:inhouse/model/event/eventList.dart';
import 'package:inhouse/util/util.dart';
import 'package:flutter/material.dart';

class EventEditDelegate extends SliverChildListDelegate {
  EventEditDelegate(
    BuildContext context,
    OneEvent content,
  ) : super(_EventEditRowList.build(context, content));
  // BuildContext context;
  // OneEvent content;
}

class _EventEditRowList {
  static final TextEditingController _titleCtrl = new TextEditingController();
  static final Color _titleColor = Colors.black; // Color(0xFF64B06E);
  static final Color _descriptionFontColor = Colors.grey;

  static void _handleTitle() {
    print(_titleCtrl.text);
  }

  static List<Widget> build(BuildContext context, OneEvent content) {
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
      EditHeroImageContainer(imgUrl: _isNew ? null : content.thumbnailImg),
    );

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
          maxLengthEnforced: false,
          decoration: const InputDecoration(
            hintText: 'Title',
          ),
        ),
      ),
    );
    // basic info container
    list.add(
      EventDetailBasicInfoContainer(
        height: 35,
        horizontalPadding: _horizontalPadding,
        verticalRowMargin: _verticalRowMargin,
        descriptionFontColor: _descriptionFontColor,
      ),
    );
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
