import 'package:Inhouse/component/community/newCommunity/newCommunityBaseCard.dart';
import 'package:Inhouse/util/theme.dart';
import 'package:flutter/material.dart';

class NewCommunityNameCard extends NewCommunityBaseCard {
  NewCommunityNameCard(this._controller, this._error);
  final TextEditingController _controller;
  final TextEditingController _error;

  @override
  Widget buildChild(BuildContext context) {
    return Container(
      child: TextField(
        controller: this._controller,
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
      ),
    );
  }
}
