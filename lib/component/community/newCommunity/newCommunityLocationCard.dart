import 'package:Inhouse/component/community/newCommunity/newCommunityBaseCard.dart';
import 'package:Inhouse/model/locationList.dart';
import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:Inhouse/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

class NewCommunityLocationCard extends NewCommunityBaseCard {
  NewCommunityLocationCard(this._controller, this.newCommunityInfo);
  final TextEditingController _controller;
  final NewCommunityInfo newCommunityInfo;

  @override
  Widget buildChild(BuildContext context) {
    if (newCommunityInfo.selectedLocation == null) {
      newCommunityInfo.selectedLocation =
          newCommunityInfo.locationList.contentsList[0];
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          readOnly: true,
          controller: this._controller,
          decoration: new InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.sentiment_satisfied_alt,
                  color: inhouseThemeColor.primaryColor),
              onPressed: null,
            ),
            hintText: newCommunityInfo.selectedLocation.toString(),
          ),
          onSubmitted: (String inputName) {
            print("submitted : " + inputName);
          },
          onTap: () {
            showMaterialScrollPicker<LocationState>(
              context: context,
              title: 'Pick Your Location',
              items: newCommunityInfo.locationList.contentsList,
              selectedItem: newCommunityInfo.selectedLocation,
              onChanged: (value) {
                this._controller.text = value.label;
                newCommunityInfo.selectedLocation =
                    newCommunityInfo.locationList.contentsList[value.index - 1];
              },
            );
          },
        ),
      ],
    );
  }
}
