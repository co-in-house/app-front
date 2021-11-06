import 'package:flutter/material.dart';
import 'package:inhouse/util/format.dart';
import 'package:state_notifier/state_notifier.dart';

class SelectDateTimeService extends StateNotifier<SelectDateTimeState> {
  SelectDateTimeService() : super(SelectDateTimeState());

  void init() {
    debugPrint("Select DateTime Service init start.");
    DateTime _targetNow = DatetimeUtil.getInitialTargetDateTime();
    state = SelectDateTimeState(
      startDateTimeStr: _targetNow.toString(),
      endDateTimeStr: _targetNow.add(Duration(hours: 2)).toString(),
    );
    debugPrint("Select DateTime Service init complete.");
  }

  void setStartDateTime(String start) {
    debugPrint(
        "Select DateTime Service setStartDateTime start. : param $start");
    String end = state.endDateTimeStr;
    int compareNum = DatetimeUtil.compareDateTimeRelationshipByString(
        start, state.endDateTimeStr);
    if (compareNum > 0) {
      // startがendを超えた場合は、間隔をそのままstartを基準にendを設定する
      end = DateTime.parse(start)
          .add(DateTime.parse(state.endDateTimeStr)
              .difference(DateTime.parse(state.startDateTimeStr)))
          .toString();
    }
    state = SelectDateTimeState(
      startDateTimeStr: start,
      endDateTimeStr: end,
    );
    debugPrint(
        "Select DateTime Service setStartDateTime compplete. : param $start");
  }

  void setEndDateTime(String end) {
    debugPrint("Select DateTime Service setEndDateTime start. : param $end");
    state = SelectDateTimeState(
      startDateTimeStr: state.startDateTimeStr,
      endDateTimeStr: end,
    );
    debugPrint(
        "Select DateTime Service setEndDateTime compplete. : param $end");
  }
}

@immutable
class SelectDateTimeState {
  SelectDateTimeState({
    this.startDateTimeStr,
    this.endDateTimeStr,
  });
  final String startDateTimeStr;
  final String endDateTimeStr;
}
