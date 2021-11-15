import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    @required this.maxLine,
    @required this.maxLength,
    @required this.textCtrl,
    @required this.textErrorCtrl,
    @required this.textColor,
    @required this.hintText,
    this.counterColor,
  });
  final int maxLine;
  final int maxLength;
  final TextEditingController textCtrl;
  final TextEditingController textErrorCtrl;
  final Color textColor;
  final Color counterColor;
  final String hintText;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CustomTextField> {
  String counter;

  @override
  void initState() {
    super.initState();
    setState(() {
      counter = "0/" + widget.maxLength.toString();
    });
  }

  void setCounter() {
    setState(() {
      counter = widget.textCtrl.text.length.toString() +
          "/" +
          widget.maxLength.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: TextField(
                  maxLines: widget.maxLine,
                  maxLength: widget.maxLength,
                  autocorrect: false,
                  enabled: true,
                  obscureText: false,
                  controller: widget.textCtrl,
                  onChanged: (String s) => setCounter(),
                  style: TextStyle(color: widget.textColor),
                  // maxLengthEnforcement: MaxLengthEnforcement.none, // 最大文字数までしか入力させない
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                    border: InputBorder.none,
                    counterText: '',
                    isDense: true,
                  ),
                ),
              ),
              _getCounterContainer(),
            ],
          ),
          AnimatedContainer(
            height: widget.textErrorCtrl.text != "" &&
                    widget.textCtrl.text.trim().length == 0
                ? 20.0
                : 0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            child: _errorContainer(),
          ),
        ],
      ),
    );
  }

  Widget _getCounterContainer() {
    Color _color = Colors.grey;
    if (widget.counterColor != null) {
      _color = widget.counterColor;
    }

    return Container(
      child: Text(
        " " + counter,
        style: widget.textCtrl.text.length > widget.maxLength
            ? TextStyle(color: Colors.red)
            : TextStyle(color: _color),
      ),
    );
  }

  Widget _errorContainer() {
    if (widget.textErrorCtrl.text != null &&
        widget.textCtrl.text.trim().length == 0) {
      return Container(
        height: 20,
        child: Text(
          widget.textErrorCtrl.text,
          style: TextStyle(color: Colors.red),
        ),
      );
    } else {
      return Container();
    }
  }
}
