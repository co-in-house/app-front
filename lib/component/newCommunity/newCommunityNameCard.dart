import 'package:Inhouse/component/newCommunity/newCommunityBaseCard.dart';
import 'package:Inhouse/util/theme.dart';
import 'package:flutter/material.dart';

class NewCommunityNameCard extends NewCommunityBaseCard {
  NewCommunityNameCard(this._controller);
  final TextEditingController _controller;

  @override
  Widget buildChild(BuildContext context) {
    return Container(
      child: TextField(
        controller: this._controller,
        decoration: new InputDecoration(
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
