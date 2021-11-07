import 'package:flutter/material.dart';
import 'package:inhouse/component/common/confirmHeroImageContinaer.dart';
import 'package:inhouse/component/common/dateTimeFixedContainer.dart';
import 'package:inhouse/component/event/edit/commSelectContainer.dart';
import 'package:inhouse/model/community/CommunityOverview.dart';
import 'package:inhouse/util/util.dart';

class EventConfirmDelegate extends SliverChildListDelegate {
  EventConfirmDelegate({
    BuildContext context,
    this.networkImgUrl,
    this.assetImgPath,
    this.title,
    this.start,
    this.end,
    this.location,
    this.selectedComm,
    this.description,
  }) : super(_EventConfirmRowList.build(
          context: context,
          networkImgUrl: networkImgUrl,
          assetImgPath: assetImgPath,
          title: title,
          start: start,
          end: end,
          location: location,
          selectedComm: selectedComm,
          description: description,
        ));
  final String networkImgUrl;
  final String assetImgPath;
  final String title;
  final String start;
  final String end;
  final String location;
  final CommunityOverview selectedComm;
  final String description;
}

class _EventConfirmRowList {
  static final Color _titleColor = Colors.black;
  static final Color _descriptionFontColor = Colors.grey;

  static List<Widget> build({
    BuildContext context,
    String networkImgUrl,
    String assetImgPath,
    String title,
    String start,
    String end,
    String location,
    CommunityOverview selectedComm,
    String description,
  }) {
    Size _screenSize = MediaQuery.of(context).size;
    final double _horizontalPadding =
        _screenSize.width * (1 - Const.containerWidthPercentage);
    List<Widget> list = [];
    // thumbnail image
    list.add(
      ConfirmHeroImageContainer(
        networkImgUrl: networkImgUrl,
        assetImgPath: assetImgPath,
      ),
    );

    // title
    list.add(
      Container(
        margin: EdgeInsets.only(top: _screenSize.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: _titleColor,
          ),
        ),
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
              child: DateTimeFixedContainer(
                label: "開始",
                descriptionFontColor: _descriptionFontColor,
                startStr: end,
                endStr: start,
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
              child: DateTimeFixedContainer(
                label: "終了",
                descriptionFontColor: _descriptionFontColor,
                startStr: end,
                endStr: start,
                isStart: false,
              ),
            ),
          ],
        ),
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
            Text(location, style: TextStyle(color: _descriptionFontColor)),
          ],
        ),
      ),
    );

    // selected community
    list.add(
      Container(
        margin: EdgeInsets.only(top: _screenSize.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: CommSelectContainer(
          canTap: false,
          fixedComm: selectedComm,
        ),
      ),
    );

    // description
    list.add(
      Container(
        margin: EdgeInsets.only(top: _screenSize.width * 0.02),
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child:
            Text(description, style: TextStyle(color: _descriptionFontColor)),
      ),
    );

    // 余白調整
    list.add(Container(height: MediaQuery.of(context).padding.bottom * 4));
    return list;
  }
}
