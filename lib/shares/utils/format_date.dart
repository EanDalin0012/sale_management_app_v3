import 'package:date_format/date_format.dart';

class FormatDateUtils {

  static String dateFormat({required String yyyyMMdd}) {
    // var d  = formatDate(DateTime(1989, 2, 21,15, 40, 10), [yyyy, '-', MM, '-', dd, '-',hh,'-',nn, '-',ss]);
    var _yyyy = int.parse(yyyyMMdd.substring(0, 4).toString());
    var _MM = int.parse(yyyyMMdd.substring(4, 6).toString());
    var _dd = int.parse(yyyyMMdd.substring(6, 8).toString());
    var vDate = formatDate(
        DateTime(_yyyy, _MM, _dd), [ dd, '-', MM, '-', yyyy]);
    return vDate;
  }

  static String dateTime({required String hhnn}) {
    var _hh = hhnn.substring(0, 2).toString();
    var _nn = hhnn.substring(2, 4).toString();
    var vTime = _hh + ':' + _nn;
    return vTime;
  }
}
