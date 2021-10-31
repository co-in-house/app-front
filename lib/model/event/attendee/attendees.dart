import 'package:inhouse/model/baseModel.dart';
import 'package:inhouse/model/event/attendee/attendeeInfo.dart';
import 'package:flutter/material.dart';

@immutable
class Attendees extends BaseModel {
  Attendees({
    this.number,
    this.communityId,
    this.eventId,
    this.attendeeInfoList, // 初期値null
    this.isLoading = false,
  });
  final List<AttendeeInfo> attendeeInfoList;
  final bool isLoading;
  final int number;
  final int communityId;
  final int eventId;

  factory Attendees.fromJson(Map<String, dynamic> json) {
    final int _number = json['number'];
    final int _communityId = json['communityId'];
    final int _eventId = json['eventId'];
    List<dynamic> _list = json['list'];
    List<AttendeeInfo> _attendeeInfoList = [];
    for (int i = 0; i < _list.length; i++) {
      var content = AttendeeInfo(
        isOrganizer: _list[i]['isOrganizer'],
        isSubscriber: _list[i]['isSubscriber'],
        url: _list[i]['url'],
        userName: _list[i]['userName'],
      );
      _attendeeInfoList.add(content);
    }
    return Attendees(
      isLoading: false,
      number: _number,
      communityId: _communityId,
      eventId: _eventId,
      attendeeInfoList: _attendeeInfoList,
    );
  }
}
