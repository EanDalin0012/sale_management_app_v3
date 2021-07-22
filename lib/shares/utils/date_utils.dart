import 'package:easy_localization/easy_localization.dart';

class DateUtil {
  static String currentDateAddDuration( Duration duration) {

      var today = DateTime.now();
      var formatter = new DateFormat('dd-MM-yyyy HH:mm:ss');
      var fiftyDaysFromNow = today.add(duration);
      String formattedDate = formatter.format(fiftyDaysFromNow);
      return formattedDate;

  }
}