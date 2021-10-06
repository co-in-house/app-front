import 'package:Inhouse/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// room modal
Future roomModal({BuildContext context, Widget content, double circular = 20}) {
  Future result = showModalBottomSheet(
    //モーダルの背景の色、透過
    backgroundColor: Colors.transparent,
    //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        // height: MediaQuery.of(context).size.height - kToolbarHeight,
        height: MediaQuery.of(context).size.height / 2,
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

// event join modal
Future eventJoinConfirmModal(BuildContext context) {
  Future result = showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Const.borderRadius),
        ),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // title
                Container(
                  child: Text(
                    "参加しましゅ！",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Robot",
                      height: 1.2,
                      fontSize: 20,
                    ),
                  ),
                ),
                // content
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "参加者一覧に追加されます",
                    style: TextStyle(
                      color: Colors.grey,
                      // fontWeight: FontWeight.bold,
                      fontFamily: "Robot",
                      height: 1.2,
                      // fontSize: 28,
                    ),
                  ),
                ),
                // action
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text("CLOSE"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text("JOIN"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[400],
                            // elevation: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );

  return result;
}

// event cancel modal
Future eventCancelConfirmModal(BuildContext context) {
  Future result = showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Const.borderRadius),
        ),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // title
                Container(
                  child: Text(
                    "やめちゃうぜ！",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Robot",
                      height: 1.2,
                      fontSize: 20,
                    ),
                  ),
                ),
                // content
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "参加者一覧から削除されます",
                    style: TextStyle(
                      color: Colors.grey,
                      // fontWeight: FontWeight.bold,
                      fontFamily: "Robot",
                      height: 1.2,
                      // fontSize: 28,
                    ),
                  ),
                ),
                // action
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text("CLOSE"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text("CANCEL"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[400],
                            // elevation: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );

  return result;
}
