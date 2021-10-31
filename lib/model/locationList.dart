import 'package:inhouse/model/baseModel.dart';
import 'package:flutter/material.dart';

// コミュニティ作成時選択用活動場所一覧
@immutable
class LocationList extends BaseModel {
  LocationList({
    this.contentsList, // 初期値 null
    this.isLoading = false,
  });
  final List<LocationState> contentsList;
  final bool isLoading;

  factory LocationList.fromJson(Map<String, dynamic> json) {
    List<dynamic> _list = json['locationList'];
    List<LocationState> obj = [];
    for (int i = 0; i < _list.length; i++) {
      var content = LocationState(
        index: _list[i]['locationId'],
        label: _list[i]['locationName'],
      );
      obj.add(content);
    }
    return LocationList(contentsList: obj, isLoading: false);
  }

  @override
  String toString() {
    return {'contentList': this.contentsList}.toString();
  }
}

class LocationState {
  LocationState({
    this.index,
    this.label,
  });
  int index;
  String label;

  @override
  String toString() {
    return this.label;
  }
}
