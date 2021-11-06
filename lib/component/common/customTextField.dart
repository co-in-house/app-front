import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    @required this.maxLine,
    @required this.maxLength,
    @required this.textCtrl,
    @required this.textColor,
    @required this.hintText,
    this.counterColor,
  });
  final int maxLine;
  final int maxLength;
  final TextEditingController textCtrl;
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
      child: Row(
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
              maxLengthEnforcement: MaxLengthEnforcement.none,
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
}
