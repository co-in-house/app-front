import 'package:inhouse/component/cut/cutContainer.dart';
import 'package:inhouse/model/cutList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CutContainerList {
  static List<Widget> build(BuildContext context, CutList cutList) {
    List<Widget> _list = [];
    if (cutList.contentsList != null && cutList.contentsList.length > 0) {
      for (int i = 0; i < cutList.contentsList.length; i++) {
        _list.add(
          CutContainer(cutInfo: cutList.contentsList[i]),
        );
      }
    } else {
      _list.add(
        Center(
          child: Text("no content!"),
        ),
      );
    }

    return _list;
  }
}
