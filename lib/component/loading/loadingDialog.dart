import 'package:flutter/material.dart';

class LoadingDialog {
  Future showIndicator(BuildContext context) async {
    _showFullScreenDialog(context, CircularProgressIndicator());
  }

  Future showCompleted(BuildContext context) async {
    if (Navigator.canPop(context)) {
      Navigator.pop(context); // Indicator画面を閉じる。
    }
    _showFullScreenDialog(context, Text("completed"));
    await new Future.delayed(new Duration(seconds: 1)); // １秒完了画面を表示する
    Navigator.pop(context); // 画面を閉じる
  }

  Future _showFullScreenDialog(BuildContext context, Widget _child) async {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionDuration: Duration(milliseconds: 300),
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return Center(child: _child);
        });
  }
}
