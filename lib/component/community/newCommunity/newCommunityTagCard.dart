import 'package:Inhouse/component/community/newCommunity/newCommunityBaseCard.dart';
import 'package:flutter/material.dart';

class NewCommunityTagCard extends NewCommunityBaseCard {
  NewCommunityTagCard(this._tagList);
  final List<Widget> _tagList;
  @override
  Widget buildChild(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: _tagList,
        ),
      ],
    );
  }
}
