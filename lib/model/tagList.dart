import 'package:Inhouse/model/baseModel.dart';
import 'package:flutter/material.dart';

// コミュニティ作成時選択用タグ一覧
@immutable
class TagList extends BaseModel {
  TagList({
    this.contentsList, // 初期値 null
    this.isLoading = false,
  });
  final List<_OneTagButtonState> contentsList;
  final bool isLoading;

  factory TagList.fromJson(Map<String, dynamic> json) {
    List<dynamic> _list = json['tagList'];
    List<_OneTagButtonState> obj = [];
    for (int i = 0; i < _list.length; i++) {
      var content = _OneTagButtonState(
        index: _list[i]['index'],
        tagLabel: _list[i]['tagLabel'],
      );
      obj.add(content);
    }
    return TagList(contentsList: obj, isLoading: false);
  }

  @override
  String toString() {
    return {'contentList': this.contentsList}.toString();
  }
}

class _OneTagButtonState {
  _OneTagButtonState({
    this.index,
    this.tagLabel,
    this.flag = false,
  });
  int index;
  String tagLabel;
  bool flag;

  @override
  String toString() {
    return {'index': this.index, 'tagLabel': this.tagLabel, 'flag': this.flag}
        .toString();
  }
}
