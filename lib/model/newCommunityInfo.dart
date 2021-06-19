import 'dart:io';

import 'package:Inhouse/model/locationList.dart';
import 'package:Inhouse/model/tagList.dart';

class NewCommunityInfo {
  NewCommunityInfo({
    this.name,
    this.tagList,
    this.content,
    this.locationList,
    this.selectedLocation,
    this.requirement,
    this.note,
    this.iconImg,
    this.headerImg,
  });
  String name;
  TagList tagList;
  String content;
  LocationList locationList;
  String requirement;
  String note;
  File iconImg;
  File headerImg;
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
      'headerPath': this.headerImg.path,
      'note': this.note,
    }.toString();
  }
}
