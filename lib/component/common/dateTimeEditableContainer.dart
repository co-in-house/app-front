import 'package:flutter/material.dart';
import 'package:inhouse/util/format.dart';
import 'package:inhouse/util/modal.dart';

class DateTimeEditableContainer extends StatefulWidget {
  const DateTimeEditableContainer({
    Key key,
    @required this.label,
    @required this.dateTextCtrl,
    this.afterDateTextCtrl,
    this.descriptionFontColor,
  }) : super(key: key);
  final Color descriptionFontColor;
  final TextEditingController dateTextCtrl;
  final TextEditingController afterDateTextCtrl;
  final String label;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<DateTimeEditableContainer> {
  String _dateTimeString;
  @override
  void initState() {
    super.initState();
    setState(() => _dateTimeString = widget.dateTextCtrl.text);
  }

// 18:00 - 20:00 => 21:00 - 20:00 となったら -> 21:00 - 22:00
// 2021年10月23日00:03分に開いたとしたら
// 初期表示24日10:00-12:00
// 幅 2021年10月23日01:05 ~ 幅 2022年10月23日01:05
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime result = await datePickerModal(
          context: context,
          initialDateTime: DateTime.parse(_dateTimeString),
        );
        if (result != null) {
          widget.dateTextCtrl.text = result.toString();
          setState(() {
            _dateTimeString = result.toString();
            // ver2.0対応へ回す
            // if (!CtrlUtil.isEmptyTextEditingCtrl(widget.afterDateTextCtrl)) {
            // if (DateTime.parse(widget.dateTextCtrl.text)
            //     .isAfter(DateTime.parse(widget.afterDateTextCtrl.text))) {
            //   print("true!!!");
            // } else {
            //   print("false!!");
            // }
            // }
          });
        }
      },
      child: Container(
        // decoration: BoxDecoration(
        //   border: Border(
        //     bottom: BorderSide(
        //       color: widget.descriptionFontColor,
        //     ),
        //   ),
        // ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                widget.label,
                style: TextStyle(color: widget.descriptionFontColor),
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                DatetimeUtil.getYearMonthDateDayStringByString(_dateTimeString),
                style: TextStyle(color: widget.descriptionFontColor),
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                DatetimeUtil.getTimeStringByString(_dateTimeString),
                style: TextStyle(color: widget.descriptionFontColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
