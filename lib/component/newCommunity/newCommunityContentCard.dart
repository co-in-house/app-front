import 'package:Inhouse/component/newCommunity/newCommunityBaseCard.dart';
import 'package:Inhouse/util/theme.dart';
import 'package:flutter/material.dart';

class NewCommunityContentCard extends NewCommunityBaseCard {
  NewCommunityContentCard(this._controller);
  final TextEditingController _controller;
  @override
  Widget buildChild(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: this._controller,
          decoration: new InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.sentiment_satisfied_alt,
                  color: inhouseThemeColor.primaryColor),
              onPressed: null,
            ),
            hintText: "活動内容を入力",
          ),
          onSubmitted: (String inputName) {
            print("submitted : " + inputName);
          },
        ),
      ],
    );
  }
}
