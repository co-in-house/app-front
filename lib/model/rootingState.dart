import 'package:Inhouse/model/baseModel.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';

@immutable
class RootingState extends BaseModel {
  RootingState({
    this.rootingState = 0,
  });
  final int rootingState;

  static bool isHome(int rs) {
    print("RootingState isHome?");
    return rs == Const.rootingNoHome;
  }

  static bool isSearch(int rs) {
    print("RootingState isSearch?");
    return rs == Const.rootingNoSearch;
  }
}
