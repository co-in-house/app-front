import 'package:Inhouse/model/baseModel.dart';
import 'package:flutter/material.dart';

@immutable
class RoutingState extends BaseModel {
  RoutingState({
    this.routingState = 0,
  });
  final int routingState;
}
