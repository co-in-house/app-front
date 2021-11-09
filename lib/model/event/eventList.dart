import 'package:inhouse/model/baseModel.dart';
import 'package:flutter/material.dart';

@immutable
class EventMatrix extends BaseModel {
  EventMatrix({
    this.contents, // 初期値null
    this.isLoading = true,
  });
  final List<List<OneEvent>> contents;
  final bool isLoading;

  factory EventMatrix.fromJson(Map<String, dynamic> json) {
    List<dynamic> _col = json['eventMatrix'];
    List<List<OneEvent>> obj = [];
    for (int i = 0; i < _col.length; i++) {
      var _row = _col[i];
      List<OneEvent> rowContents = [];
      for (int j = 0; j < _row.length; j++) {
        var content = OneEvent(
          communityId: _row[j]['communityId'],
          eventId: _row[j]['eventId'],
          title: _row[j]['title'],
          start: _row[j]['start'],
          end: _row[j]['end'],
          location: _row[j]['location'],
          thumbnailImg: _row[j]['thumbnailImg'],
          description: _row[j]['description'],
        );
        rowContents.add(content);
      }
      obj.add(rowContents);
    }
    return EventMatrix(contents: obj, isLoading: false);
  }
}

class OneEvent {
  OneEvent({
    this.communityId,
    this.eventId,
    this.title,
    this.start,
    this.end,
    this.location,
    this.thumbnailImg,
    this.description,
  });
  num communityId;
  num eventId;
  String title;
  String start;
  String end;
  String location;
  String thumbnailImg;
  String description;
}
