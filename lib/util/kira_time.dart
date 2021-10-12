import 'package:intl/intl.dart';

class KTime {
  ///now DateTime
  static var now = new DateTime.now();

  ///millisecondsSinceEpoch
  static int millisecondsSinceEpoch = now.millisecondsSinceEpoch;

  ///timeString
  ///if [milliseconds] is null ,time is now
  ///you can change timeString type from [timeType]
  ///example: timeType="yyyyMMdd-HHmmss"
  static String getTimeStr({String? timeType, int? milliseconds}) {
    String timeStr = "";
    if (milliseconds != null) {
      if (milliseconds.toString().length == 10) {
        milliseconds = milliseconds * 1000;
      }
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
      timeStr = DateFormat(timeType ?? 'yyyy-MM-dd HH:mm').format(dateTime);
    } else {
      timeStr = DateFormat(timeType ?? 'yyyy-MM-dd HH:mm').format(now);
    }
    return timeStr;
  }
}
