import 'package:inhouse/component/community/newCommunity/newCommunityBaseCard.dart';
import 'package:inhouse/util/theme.dart';
import 'package:flutter/material.dart';

class NewCommunityNameCard extends NewCommunityBaseCard {
  NewCommunityNameCard(this._controller, this._error);
  final TextEditingController _controller;
  final TextEditingController _error;
  final int _maxLength = 20;
  @override
  Widget buildChild(BuildContext context) {
    return TextField(
      autocorrect: false,
      controller: this._controller,
      maxLength: _maxLength,
      decoration: new InputDecoration(
        errorText: this._error.text != "" ? this._error.text : null,
        suffixIcon: IconButton(
          icon: Icon(Icons.sentiment_satisfied_alt,
              color: inhouseThemeColor.primaryColor),
          onPressed: null,
        ),
        hintText: "コミュニテイ名を入力",
      ),
      onSubmitted: (String inputName) {
        print("submitted : " + inputName);
      },
    );
  }
}
