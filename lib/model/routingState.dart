import 'package:Inhouse/model/baseModel.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';

@immutable
class RoutingState extends BaseModel {
  RoutingState({
    this.routingState = 0,
  });
  final int routingState;

  static bool isHome(int rs) {
    print("routingState isHome?");
    return rs == Const.rootingNoHome;
  }

  static bool isSearch(int rs) {
    print("routingState isSearch?");
    return rs == Const.rootingNoSearch;
  }
}
