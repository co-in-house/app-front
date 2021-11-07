import 'package:flutter/material.dart';
import 'package:inhouse/util/modal.dart';

class CustomLongTextField extends StatefulWidget {
  const CustomLongTextField({Key key, @required this.textCtrl})
      : super(key: key);

  final TextEditingController textCtrl;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CustomLongTextField> {
  String text;
  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.textCtrl == null ||
          widget.textCtrl.text == null ||
          widget.textCtrl.text == "") {
        text = "";
      } else {
        text = widget.textCtrl.text;
      }
    });
  }

  @override
  void dispose() {
    debugPrint("dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        String _tmpText = await inputLongTextModal(
          context: context,
          textCtrl: widget.textCtrl,
          maxLength: 500,
          hintLabel: "詳細内容を追加する",
        );
        if (_tmpText != null) {
          setState(() {
            text = _tmpText;
          });
        }
      },
      child: Text(
        text == "" ? "詳細内容を追加する" : text,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
