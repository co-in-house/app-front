class Const {
  static final routingNoHome = 0;
  static final routingNoExplore = 1;
  static final routingNoLounge = 2;
  static final routingNoEvent = 3;
  static final routingNoMessage = 4;
}

class DatetimeUtil {
  static String getCurrentDateString() {
    DateTime now = DateTime.now();
    String day = now.day.toString();
    String month = now.month.toString();
    String year = now.year.toString();
    String hour = now.hour.toString();
    String minute = now.minute.toString();
    return year + "/" + month + "/" + day + " " + hour + ":" + minute;
  }
}
