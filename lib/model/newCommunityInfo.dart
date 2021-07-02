import 'dart:convert';
import 'dart:io';

import 'package:Inhouse/model/baseModel.dart';
import 'package:Inhouse/model/locationList.dart';
import 'package:Inhouse/model/tagList.dart';
import 'package:Inhouse/util/util.dart';

class NewCommunityInfo extends BaseModel {
  NewCommunityInfo({
    this.isLoading = false,
    this.name,
    this.tagList,
    this.content,
    this.locationList,
    this.selectedLocation,
    this.requirement,
    this.note,
    this.iconImg,
  });
  bool isLoading;
  String name;
  TagList tagList;
  String content;
  LocationList locationList;
  String requirement;
  String note;
  File iconImg;
  LocationState selectedLocation;

  @override
  String toString() {
    return {
      'name': this.name,
      'tagList': this.tagList,
      'content': this.content,
      'selectedLocation': this.selectedLocation,
      'requirement': this.requirement,
      'iconPath': this.iconImg.path,
      'note': this.note,
    }.toString();
  }

  Map<String, Object> toJson() {
    List<String> _selectedTagList = [];
    for (var item in this.tagList.contentsList) {
      if (item.flag) {
        _selectedTagList.add(item.label);
      }
    }
    String image64 = "";

    if (this.iconImg.path.substring(0, Const.assetDirName.length) !=
        Const.assetDirName) {
      final bytes = this.iconImg.readAsBytesSync();
      image64 = base64Encode(bytes);
    }

    return {
      'name': this.name,
      'tagList': _selectedTagList,
      'locationId': this.selectedLocation.index,
      'content': this.content,
      'image64': image64,
      'requirement': this.requirement,
      'note': this.note,
    };
  }

  List<String> getTagLabelList() {
    List<String> labelList = [];
    for (var index = 0; index < this.tagList.contentsList.length; index++) {
      if (this.tagList.contentsList[index].flag) {
        labelList.add(this.tagList.contentsList[index].label);
      }
    }

    return labelList;
  }
}
