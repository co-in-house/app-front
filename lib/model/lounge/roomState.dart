import 'package:Inhouse/model/baseModel.dart';
import 'package:flutter/material.dart';

@immutable
class RoomState extends BaseModel {
  RoomState({
    this.index = 0,
    this.communityId = 0,
    this.communityName = "",
    this.roomName = "",
  });
  final int index;
  final String roomName;
  final int communityId;
  final String communityName;
}
