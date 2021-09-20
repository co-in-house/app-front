import 'package:Inhouse/model/baseModel.dart';
import 'package:flutter/material.dart';

@immutable
class ColorModeState extends BaseModel {
  ColorModeState({
    this.isDarkMode = false,
  });
  final bool isDarkMode;
}
