import 'dart:io';

import 'package:inhouse/model/baseModel.dart';
import 'package:inhouse/model/locationList.dart';
import 'package:inhouse/model/tagList.dart';

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
    this.iconImgUrl,
  });
  bool isLoading;
  String name;
  TagList tagList;
  String content;
  LocationList locationList;
  String requirement;
  String note;
  File iconImg;
  String iconImgUrl;
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
      'iconImgUrl': this.iconImgUrl,
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

    return {
      'name': this.name,
      'tagList': _selectedTagList,
      'locationId': this.selectedLocation.index,
      'content': this.content,
      'iconImgUrl': this.iconImgUrl,
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
