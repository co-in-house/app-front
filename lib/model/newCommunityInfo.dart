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
  });
  String name;
  TagList tagList;
  String content;
  LocationList locationList;
  int selectedLocationIndex;
  String selectedLocationLabel;
  String requirement;

  @override
  String toString() {
    return {
      'name': this.name,
      'tagList': this.tagList,
      'content': this.content,
      'selectedLocationIndex': this.selectedLocationIndex,
      'selectedLocationLabel': this.selectedLocationLabel,
      'requirement': this.requirement,
    }.toString();
  }
}
