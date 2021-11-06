import 'package:flutter/material.dart';
import 'package:inhouse/service/event/selectTimeService.dart';
import 'package:inhouse/util/format.dart';
import 'package:inhouse/util/modal.dart';
import 'package:provider/provider.dart';

class DateTimeEditableContainer extends StatelessWidget {
  const DateTimeEditableContainer({
    Key key,
    @required this.label,
    @required this.selectDateTime,
    @required this.isStart,
    this.descriptionFontColor,
  }) : super(key: key);
  final Color descriptionFontColor;
  final SelectDateTimeState selectDateTime;
  final String label;
  final bool isStart;

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
          initialDateTime: isStart
              ? DateTime.parse(this.selectDateTime.startDateTimeStr)
              : DateTime.parse(this.selectDateTime.endDateTimeStr),
        );
        if (result != null) {
          this.isStart
              ? context
                  .read<SelectDateTimeService>()
                  .setStartDateTime(result.toString())
              : context
                  .read<SelectDateTimeService>()
                  .setEndDateTime(result.toString());
        }
      },
      child: Container(
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
                          this.selectDateTime.startDateTimeStr),
                      style: TextStyle(color: this.descriptionFontColor),
                    )
                  : DatetimeUtil.isSameDate(
                          this.selectDateTime.startDateTimeStr,
                          this.selectDateTime.endDateTimeStr)
                      ? Text("")
                      : Text(
                          DatetimeUtil.getYearMonthDateDayStringByString(
                              this.selectDateTime.endDateTimeStr),
                          style:
                              DatetimeUtil.compareDateTimeRelationshipByString(
                                          this.selectDateTime.startDateTimeStr,
                                          this.selectDateTime.endDateTimeStr) >
                                      0
                                  ? TextStyle(
                                      color: Colors.red,
                                      decoration: TextDecoration.lineThrough)
                                  : TextStyle(color: this.descriptionFontColor),
                        ),
            ),
            Flexible(
              flex: 1,
              child: isStart
                  ? Text(
                      DatetimeUtil.getTimeStringByString(
                          this.selectDateTime.startDateTimeStr),
                      style: TextStyle(color: this.descriptionFontColor),
                    )
                  : Text(
                      DatetimeUtil.getTimeStringByString(
                          this.selectDateTime.endDateTimeStr),
                      style: DatetimeUtil.compareDateTimeRelationshipByString(
                                  this.selectDateTime.startDateTimeStr,
                                  this.selectDateTime.endDateTimeStr) >
                              0
                          ? TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough)
                          : TextStyle(color: this.descriptionFontColor),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
