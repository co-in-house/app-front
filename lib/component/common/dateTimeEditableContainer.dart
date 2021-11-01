import 'package:flutter/material.dart';
import 'package:inhouse/util/format.dart';
import 'package:inhouse/util/modal.dart';

class DateTimeEditableContainer extends StatefulWidget {
  const DateTimeEditableContainer({
    Key key,
    @required this.dateTextCtrl,
    @required this.label,
    this.descriptionFontColor,
    this.minimumDate,
  }) : super(key: key);
  final Color descriptionFontColor;
  final DateTime minimumDate;
  final TextEditingController dateTextCtrl;
  final String label;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<DateTimeEditableContainer> {
  String _dateTimeString;
  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.dateTextCtrl == null ||
          widget.dateTextCtrl.text == null ||
          widget.dateTextCtrl.text == "") {
        print(widget.minimumDate.toString());
        _dateTimeString = widget.minimumDate.toString();
      } else {
        _dateTimeString = widget.dateTextCtrl.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime result = await datePickerModal(
          context: context,
          minimumDate: widget.minimumDate,
        );
        if (result != null) {
          print(result.toString());
          widget.dateTextCtrl.text = result.toString();
          setState(() => _dateTimeString = result.toString());
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: widget.descriptionFontColor,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
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
