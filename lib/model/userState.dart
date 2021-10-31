import 'package:inhouse/model/baseModel.dart';
import 'package:flutter/material.dart';

@immutable
class UserState extends BaseModel {
  UserState({
    this.isLogined = false,
    this.isLoading = false,
  });
  final bool isLogined;
  final bool isLoading;
}
