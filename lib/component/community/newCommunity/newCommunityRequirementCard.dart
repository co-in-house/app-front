import 'package:inhouse/component/community/newCommunity/newCommunityBaseCard.dart';
import 'package:inhouse/util/theme.dart';
import 'package:flutter/material.dart';

class NewCommunityRequirementCard extends NewCommunityBaseCard {
  NewCommunityRequirementCard(this._controller);
  final TextEditingController _controller;
  final int _maxLength = 1000;

  @override
  Widget buildChild(BuildContext context) {
    return TextField(
      autocorrect: false,
      keyboardType: TextInputType.multiline,
      maxLines: 10,
      maxLength: _maxLength,
      controller: this._controller,
      decoration: new InputDecoration(
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(Icons.sentiment_satisfied_alt,
              color: inhouseThemeColor.primaryColor),
          onPressed: null,
        ),
        hintText: "入会条件を入力",
      ),
    );
  }
}
