import 'package:Inhouse/model/baseModel.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';

@immutable
class RoutingState extends BaseModel {
  RoutingState({
    this.routingState = Const.routingNoLounge,
  });
  final int routingState;
}
