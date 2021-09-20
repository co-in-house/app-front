import 'package:flutter/material.dart';

// modal間の受け渡し用
class TappedRoomInfoForModal {
  TappedRoomInfoForModal({@required this.index, @required this.label});

  final int index;
  final String label;
}
