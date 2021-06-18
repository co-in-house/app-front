import 'package:Inhouse/component/newCommunity/newCommunityBaseCard.dart';
import 'package:Inhouse/util/theme.dart';
import 'package:flutter/material.dart';

class NewCommunityRequirementCard extends NewCommunityBaseCard {
  NewCommunityRequirementCard(this._controller);
  final TextEditingController _controller;
  @override
  Widget buildChild(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          autocorrect: false,
          keyboardType: TextInputType.multiline,
          maxLines: 3,
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
          onSubmitted: (String inputName) {
            print("submitted : " + inputName);
          },
        ),
      ],
    );
  }
}
