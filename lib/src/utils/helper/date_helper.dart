import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class DateHelper {
  static String timeAgo({String? dateStr, DateTime? dateTime}) {
    if (dateStr == null && dateTime == null) return "";
    DateTime? dt = dateTime ?? DateTime.tryParse(dateStr!)?.toLocal();
    if (dt == null) return "";
    return timeago.format(dt, locale: Get.locale?.languageCode??"en",);
  }

  static String formatSpentTime(var spentSeconds) {
    // int spentSeconds = 120; // Replace with your actual spent time in seconds
    String formattedTime = '';
    try{
      Duration duration = Duration(seconds: int.parse(spentSeconds));
      if (duration.inHours > 0) {
        formattedTime = '${duration.inHours}h ${duration.inMinutes % 60}m';
      } else if (duration.inMinutes > 0) {
        formattedTime = '${duration.inMinutes}m ${duration.inSeconds % 60}s';
      } else {
        formattedTime = '${duration.inSeconds}s';
      }
      return formattedTime;
    }catch(e){
      return formattedTime;
    }

  }

  static String formatDuration(int milliseconds) {
    // Convert milliseconds to Duration
    final duration = Duration(milliseconds: milliseconds);

    // Calculate individual units
    final days = duration.inDays;
    final hours = duration.inHours % 24; // Hours within current day
    final minutes = duration.inMinutes % 60; // Minutes within current hour
    final seconds = duration.inSeconds % 60; // Seconds within current minute

    // Build the formatted string (adjust formatting as desired)
    final buffer = StringBuffer();
    if (days > 0) {
      buffer.write('$days${days == 1 ? 'd,' : 'w,'} ');
    }
    if (hours > 0) {
      buffer.write('$hours h, ');
    }
    buffer.write('$minutes m, $seconds s');
    return buffer.toString().trim();
  }


  static String printDuration(Duration duration) {
    String negativeSign = duration.isNegative ? '-' : '';
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
    return "$negativeSign${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

 static  String formatDate(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);
    DateFormat formatter = DateFormat.yMMMMd('ar');
    return formatter.format(dateTime);
  }

  static String dateTimeTOString(
      {required DateTime? dateTime, String dateFormat = 'MM/yyyy'}) {
    String formattedDate = DateFormat(dateFormat).format(dateTime!);
    return formattedDate;
  }

  static DateTime stringToDateTime(
      {required String str_date, String dateFormat = 'hh:mm aa'}) {
    DateTime dateTime = DateFormat(dateFormat).parse(str_date);

    return dateTime;
  }

  static String doubleToString(
      {required double time, String dateFormat = 'ms'}) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(time.toInt() * 1000);
    String result = DateFormat(dateFormat).format(dateTime);

    return result;
  }

  static String formatTimeAgo({String? dateString}) {
    var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString??"", true);

    final localDateTime = dateTime.toLocal(); // Convert to local time
    final now = DateTime.now();
    final difference = now.difference(localDateTime);

    // final now = DateTime.now();
    // final difference = now.difference(dateTime);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return 'Since $years years ';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return 'Since $months months ';
    } else if (difference.inDays > 7) {
      final weeks = (difference.inDays / 7).floor();
      return 'Since $weeks weeks ';
    } else if (difference.inDays > 0) {
      return 'Since ${difference.inDays} day ';
    } else if (difference.inHours > 0) {
      return 'Since ${difference.inHours} hour ';
    } else if (difference.inMinutes > 0) {
      return 'Since ${difference.inMinutes} minutes ';
    } else {
      return 'Since ${difference.inSeconds} Seconds ';
    }
  }


}
