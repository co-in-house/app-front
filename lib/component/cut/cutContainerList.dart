import 'package:Inhouse/component/cut/cutContainer.dart';
import 'package:Inhouse/model/cutList.dart';
import 'package:flutter/material.dart';

class CutContainerList {
  static List<Widget> build(BuildContext context, CutList cutList) {
    List<Widget> _list = [];
    if (cutList.contentsList != null && cutList.contentsList.length > 0) {
      for (int i = 0; i < cutList.contentsList.length; i++) {
        _list.add(
          CutContainer(img: cutList.contentsList[i].img),
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
