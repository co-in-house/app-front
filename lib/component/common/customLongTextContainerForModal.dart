import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomLongTextContainerForModal extends StatefulWidget {
  const CustomLongTextContainerForModal({
    Key key,
    @required this.paddingTop,
    @required this.textCtrl,
    @required this.hintLabel,
    @required this.maxLength,
  }) : super(key: key);
  final double paddingTop;
  final int maxLength;
  final TextEditingController textCtrl;
  final String hintLabel;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CustomLongTextContainerForModal> {
  String _counter;
  String _preText;
  String _errorMessage;

  @override
  void initState() {
    super.initState();
    setState(() {
      _preText = widget.textCtrl.text;
    });
    setCounter();
  }

  void setCounter() {
    setState(() {
      _counter = widget.textCtrl.text.length.toString() +
          "/" +
          widget.maxLength.toString();
      if (widget.textCtrl.text.length > widget.maxLength) {
        _errorMessage = widget.maxLength.toString() + "文字数以内にしてください。";
      } else {
        _errorMessage = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    // String _preText = widget.textCtrl.text;
    return Container(
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      padding: EdgeInsets.only(top: widget.paddingTop),
      margin: EdgeInsets.only(top: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.paddingTop),
          topRight: Radius.circular(widget.paddingTop),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CupertinoButton(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Text(
                    'キャンセル',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  onPressed: () {
                    widget.textCtrl.text = _preText;
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  // padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Text(
                    '決定',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: _isOver()
                      ? null
                      : () => Navigator.of(context).pop(widget.textCtrl.text),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Divider(
              height: 0,
              thickness: 1,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: 10,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Scrollbar(
                controller: _scrollController,
                isAlwaysShown: false,
                child: TextField(
                  maxLines: null,
                  maxLength: widget.maxLength,
                  scrollController: _scrollController,
                  controller: widget.textCtrl,
                  onChanged: (String s) => setCounter(),
                  autofocus: true,
                  autocorrect: false,
                  enabled: true,
                  obscureText: false,
                  maxLengthEnforcement: MaxLengthEnforcement.none,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.red),
                    errorMaxLines: 1,
                    hintText: widget.hintLabel,
                    border: InputBorder.none,
                    counterText: '',
                    isDense: true,
                  ),
                ),
              ),
            ),
          ),
          Container(
              height: 40,
              // alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey[300]),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        _errorMessage,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  _getCounterContainer(),
                ],
              )),
          Container(
            height: MediaQuery.of(context).viewInsets.bottom,
          ),
        ],
      ),
    );
  }

  Widget _getCounterContainer() {
    Color _color = Colors.grey;
    return Container(
      child: Text(
        " " + _counter,
        style: widget.textCtrl.text.length > widget.maxLength
            ? TextStyle(color: Colors.red)
            : TextStyle(color: _color),
      ),
    );
  }

  bool _isOver() {
    return widget.maxLength < widget.textCtrl.text.length;
  }
}
