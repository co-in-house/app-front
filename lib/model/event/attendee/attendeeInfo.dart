import 'package:flutter/material.dart';

class AttendeeInfo {
  AttendeeInfo({
    @required this.userName,
    @required this.url,
    @required this.isOrganizer,
    @required this.isSubscriber,
  });
  final String userName;
  final String url;
  final bool isOrganizer;
  final bool isSubscriber;
}
