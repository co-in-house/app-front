import 'package:inhouse/component/appBar/sliverAppBarUserMenu.dart';
import 'package:inhouse/component/common/expansionLine.dart';
import 'package:inhouse/component/userMenu/communityListScrollViewContainer.dart';
import 'package:inhouse/component/userMenu/userHelpContainer.dart';
import 'package:inhouse/component/userMenu/userSettingContainer.dart';
import 'package:inhouse/component/userMenu/userProfileContainer.dart';
import 'package:flutter/material.dart';

class UserMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("========UserMenuPage build========");

    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBarUserMenu(),
          SliverList(delegate: _UserMenuDelegate(context)),
        ],
      ),
    );
  }
}

class _UserMenuDelegate extends SliverChildListDelegate {
  _UserMenuDelegate(BuildContext context) : super(_UserProfile.build(context));
  BuildContext context;
}

class _UserProfile {
  static final List<ExpansionLineItem> _expansionItems = [
    ExpansionLineItem(
      headerValue: 'コミュニティ一覧',
      expandedWidget: CommunityListScrollViewContainer(),
    ),
    ExpansionLineItem(
      headerValue: '設定',
      expandedWidget: UserSettingContainer(),
      isExpanded: true,
    ),
    ExpansionLineItem(
      headerValue: 'ヘルプ',
      expandedWidget: UserHelpContainer(),
      isExpanded: true,
    )
  ];
  static List<Widget> build(BuildContext context) {
    List<Widget> list = [];
    list.add(UserProfileContainer());
    list.add(ExpansionLine(itemList: _expansionItems));
    return list;
  }
}
