import 'package:Inhouse/component/appBar.dart';
import 'package:Inhouse/model/locationList.dart';
import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:Inhouse/util/theme.dart';
import 'package:Inhouse/util/util.dart';
import 'package:Inhouse/view/newCommunity/newCommunityRequirementPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

class NewCommunityLocationPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  NewCommunityLocationPage({this.newCommunityInfo});
  final NewCommunityInfo newCommunityInfo;
  @override
  Widget build(BuildContext context) {
    LocationState _selectedState =
        newCommunityInfo.locationList.contentsList[0];
    newCommunityInfo.selectedLocationIndex =
        newCommunityInfo.locationList.contentsList[0].index;
    newCommunityInfo.selectedLocationLabel =
        newCommunityInfo.locationList.contentsList[0].label;
    return Scaffold(
      appBar: CustomAppBarCommunity.location(context),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width *
              Const.containerWidthPercentage,
          child: Column(
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
                  hintText: _selectedState.toString(),
                ),
                onSubmitted: (String inputName) {
                  print("submitted : " + inputName);
                },
                onTap: () {
                  showMaterialScrollPicker<LocationState>(
                    context: context,
                    title: 'Pick Your Location',
                    items: newCommunityInfo.locationList.contentsList,
                    selectedItem: _selectedState,
                    onChanged: (value) {
                      this._controller.text = value.label;
                      newCommunityInfo.selectedLocationIndex = value.index;
                      newCommunityInfo.selectedLocationLabel = value.label;
                      _selectedState = newCommunityInfo
                          .locationList.contentsList[value.index - 1];
                    },
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: Text("次へ"),
                    style: ElevatedButton.styleFrom(
                      elevation: 16,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewCommunityRequirementPage(
                              newCommunityInfo: newCommunityInfo),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StateModel {
  const StateModel(this.name, this.code);
  final String code;
  final String name;

  @override
  String toString() => name;
}
