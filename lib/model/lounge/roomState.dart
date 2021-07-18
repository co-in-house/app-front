import 'package:Inhouse/model/baseModel.dart';
import 'package:flutter/material.dart';

@immutable
class RoomState extends BaseModel {
  RoomState({
    this.index = 0,
    this.communityId = 0,
  });
  final int index;
  final int communityId;
}
