import 'package:flutter/material.dart';

// select room modal
Future<int> roomModal(
    {BuildContext context, Widget content, double circular = 20}) {
  Future<int> result = showModalBottomSheet<int>(
    //モーダルの背景の色、透過
    backgroundColor: Colors.transparent,
    //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        // height: MediaQuery.of(context).size.height - kToolbarHeight,
        height: (MediaQuery.of(context).size.height - kToolbarHeight) / 3,
        padding: EdgeInsets.symmetric(
          vertical: circular,
          //  horizontal: MediaQuery.of(context).size.width * 0.05, //横スクロールがあるから余白なし。
        ),
        margin: EdgeInsets.only(top: 1),
        decoration: BoxDecoration(
          //モーダル自体の色
          color: Colors.white,
          //角丸にする
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(circular),
            topRight: Radius.circular(circular),
          ),
        ),
        child: content,
      );
    },
  );
  return result;
}
