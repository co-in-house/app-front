import 'package:Inhouse/component/community/newCommunity/newCommunityBaseCard.dart';
import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewCommunityImageCard extends NewCommunityBaseCard {
  NewCommunityImageCard(
    this.newCommunityInfo,
    this._iconButton,
  );
  final NewCommunityInfo newCommunityInfo;
  final Widget _iconButton;

  @override
  Widget buildChild(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(0.0),
              alignment: Alignment.center,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(newCommunityInfo.iconImg.path),
                ),
              ),
            ),
            _iconButton,
          ],
        ),
      ],
    );
  }
}
