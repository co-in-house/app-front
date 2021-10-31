import 'package:inhouse/model/baseModel.dart';
import 'package:inhouse/util/util.dart';
import 'package:flutter/material.dart';

@immutable
class RoutingState extends BaseModel {
  RoutingState({
    this.routingState = Const.routingNoLounge,
  });
  final int routingState;
}
