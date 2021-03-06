import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NumberUtil {
  static final numberFormat = NumberFormat("#,###");
  static String formattedInteger(int number) {
    return numberFormat.format(number);
  }
}

class DatetimeUtil {
  static bool isSameDate(String dtStr1, String dtStr2) {
    return DateTime.parse(dtStr1).difference(DateTime.parse(dtStr2)).inDays ==
        0;
  }

  static int compareDateTimeRelationshipByString(String before, String after) {
    return DateTime.parse(before).compareTo(DateTime.parse(after));
  }

  // 現在時刻を丸めて1日後
  static DateTime getInitialTargetDateTime() {
    DateTime now = DateTime.now();
    Duration addDuration = Duration(days: 1, minutes: 5 - now.minute % 5);
    return now.add(addDuration);
  }

  // 2021-11-02 03:22:00.000
  static String getYearMonthDateDayStringByString(String dtStr,
      [String delimiter = "/"]) {
    return dtStr.substring(0, 4) +
        delimiter +
        dtStr.substring(5, 7) +
        delimiter +
        dtStr.substring(8, 10) +
        " " +
        getDayJaStringByIndex(DateTime.parse(dtStr).weekday);
  }

  static String getTimeStringByString(String dtStr) {
    return dtStr.substring(11, 13) + ":" + dtStr.substring(14, 16);
  }

  static String getDayJaStringByIndex(int i) {
    switch (i) {
      case 1:
        return "月";
      case 2:
        return "火";
      case 3:
        return "水";
      case 4:
        return "木";
      case 5:
        return "金";
      case 6:
        return "土";
      case 7:
        return "日";
      default:
        return "";
    }
  }
}

class TimestampUtil {
  // 2019-10-01 12:00:00.0 -> 12:00
  static String getTimeStringOfTimeStamp(String s) {
    return s.substring(11, 16);
  }

  // 2019-10-23 12:00:00.0 -> 2 3 空白あり
  static String getDateStringOfTimeStamp(String s) {
    return s.substring(8, 9) + " " + s.substring(9, 10);
  }

  // 2019-10-31 12:00:00.0 -> SUN
  static String getDayStringOfTimeStamp(String s) {
    DateTime date = DateTime.parse(s);
    return getDayByIndex(date.weekday);
  }

  // 2019-10-31 12:00:00.0 -> October 2019
  static String getYearMonthOfTimeStamp(String s) {
    return getMonthStringByNum(s.substring(5, 7)) + " " + s.substring(0, 4);
  }

  static String getDayByIndex(int i) {
    switch (i) {
      case 1:
        return "MON";
      case 2:
        return "TUE";
      case 3:
        return "WED";
      case 4:
        return "THU";
      case 5:
        return "FRI";
      case 6:
        return "SAT";
      case 7:
        return "SUN";
      default:
        return "";
    }
  }

  static String getMonthStringByNum(String s) {
    switch (s) {
      case "01":
        return "January";
      case "02":
        return "February";
      case "03":
        return "March";
      case "04":
        return "April";
      case "05":
        return "May";
      case "06":
        return "June";
      case "07":
        return "July";
      case "08":
        return "August";
      case "09":
        return "September";
      case "10":
        return "October";
      case "11":
        return "November";
      case "12":
        return "December";
      default:
        return "";
    }
  }
}

class CtrlUtil {
  static bool isEmptyTextEditingCtrl(TextEditingController tec) {
    return tec == null || tec.text == null || tec.text.trim() == "";
  }
}
