import 'package:flutter/material.dart';
import 'package:inhouse/util/format.dart';

class DateTimeFixedContainer extends StatelessWidget {
  const DateTimeFixedContainer({
    Key key,
    @required this.label,
    @required this.startStr,
    @required this.endStr,
    @required this.isStart,
    this.descriptionFontColor,
  }) : super(key: key);
  final Color descriptionFontColor;
  final String label;
  final String startStr;
  final String endStr;
  final bool isStart;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              this.label,
              style: TextStyle(color: this.descriptionFontColor),
            ),
          ),
          Flexible(
            flex: 1,
            child: isStart
                ? Text(
                    DatetimeUtil.getYearMonthDateDayStringByString(
                        this.startStr),
                    style: TextStyle(color: this.descriptionFontColor),
                  )
                : DatetimeUtil.isSameDate(this.startStr, this.endStr)
                    ? Text("")
                    : Text(
                        DatetimeUtil.getYearMonthDateDayStringByString(
                            this.endStr),
                        style: TextStyle(color: this.descriptionFontColor),
                      ),
          ),
          Flexible(
            flex: 1,
            child: isStart
                ? Text(
                    DatetimeUtil.getTimeStringByString(this.startStr),
                    style: TextStyle(color: this.descriptionFontColor),
                  )
                : Text(
                    DatetimeUtil.getTimeStringByString(this.endStr),
                    style: TextStyle(color: this.descriptionFontColor),
                  ),
          ),
        ],
      ),
    );
  }
}
