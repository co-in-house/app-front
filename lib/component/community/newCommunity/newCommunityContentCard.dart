import 'package:inhouse/component/community/newCommunity/newCommunityBaseCard.dart';
import 'package:inhouse/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewCommunityContentCard extends NewCommunityBaseCard {
  NewCommunityContentCard(this._controller);
  final TextEditingController _controller;
  final int _maxLength = 2000;

  @override
  Widget buildChild(BuildContext context) {
    return TextField(
      autocorrect: false,
      keyboardType: TextInputType.multiline,
      maxLines: 10,
      maxLength: _maxLength,
      maxLengthEnforcement: MaxLengthEnforcement.none,
      controller: this._controller,
      decoration: new InputDecoration(
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(Icons.sports_baseball_outlined,
              color: inhouseThemeColor.primaryColor),
          onPressed: null,
        ),
        hintText: "活動内容を入力",
      ),
    );
  }
}
