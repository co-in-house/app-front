import 'package:inhouse/model/baseModel.dart';
import 'package:flutter/material.dart';

@immutable
class Sample extends BaseModel {
  Sample({
    this.count = 0,
    this.message = "submitを押してね",
    this.isLoading = false,
  });
  final int count;
  final String message;
  final bool isLoading;

  factory Sample.fromJson(Map<String, dynamic> json) {
    return Sample(
      count: json['count'],
      message: json['message'],
    );
  }
}
