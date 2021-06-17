import 'dart:io';

import 'package:Inhouse/model/locationList.dart';
import 'package:Inhouse/model/tagList.dart';

class NewCommunityInfo {
  NewCommunityInfo({
    this.name,
    this.tagList,
    this.content,
    this.locationList,
    this.selectedLocationIndex,
    this.selectedLocationLabel,
    this.requirement,
    this.note,
    this.iconImg,
    this.headerImg,
  });
  String name;
  TagList tagList;
  String content;
  LocationList locationList;
  int selectedLocationIndex;
  String selectedLocationLabel;
  String requirement;
  String note;
  File iconImg;
  File headerImg;

  @override
  String toString() {
    return {
      'name': this.name,
      'tagList': this.tagList,
      'content': this.content,
      'selectedLocationIndex': this.selectedLocationIndex,
      'selectedLocationLabel': this.selectedLocationLabel,
      'requirement': this.requirement,
      'note': this.note,
    }.toString();
  }
}
