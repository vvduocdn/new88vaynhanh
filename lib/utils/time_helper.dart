import 'package:intl/intl.dart';

class TimerHelper {
  String formatCurrencyJP(String number) {
    try {
      return NumberFormat.currency(
        locale: 'ja-JP',
        decimalDigits: 0,
        symbol: '',
      ).format(int.parse(number)).toString();
    } on Exception catch (_) {
      return "0";
    }
  }
}

extension TimerHelperExtension on DateTime {
  String get fym {
    final String month = DateFormat.M().format(this);
    final String year = DateFormat.y().format(this);
    return "$year$month";
  }

  String get month {
    final String month = DateFormat.M().format(this);
    return month;
  }

  String get year {
    final String year = DateFormat.y().format(this);
    return year;
  }

  String get days {
    final String date = DateFormat.d().format(this);
    return date;
  }

  String get ymd {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String get dmy {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String get week {
    return DateFormat('EEE').format(this);
  }

  String get mmmdy {
    return DateFormat('MMM dd, yyyy').format(this);
  }

  String get eeeemmmdy {
    return DateFormat('EEEE, MMM dd, yyyy').format(this);
  }

  String get mmmy {
    return DateFormat('MMM, yyyy').format(this);
  }

  String get mmy {
    return DateFormat('MMMM yyyy').format(this);
  }

  String get mmmd {
    return DateFormat('MMM dd').format(this);
  }

  String get hmsymd {
    return DateFormat('HH:mm:ss yyyy-MM-dd').format(this);
  }

  String get hmymd {
    return DateFormat('HH:mm, dd/MM/yyyy').format(this);
  }

  String get ymdhm {
    return DateFormat('dd/MM/yyyy - HH:mm').format(this);
  }

  String get hm {
    return DateFormat('HH:mm').format(this);
  }

  String get dayJP {
    final String weekday = DateFormat("yyyy年MM月dd日 (E)", "ja").format(this);
    return weekday;
  }

  DateTime get timeNowUtc {
    int month = DateTime.parse(ymd).month;

    int year = DateTime.parse(ymd).year;

    int days = int.parse(DateTime.parse(ymd).days);

    return DateTime.utc(year, month, days, 0, 0, 0);
  }

  DateTime get timeNow {
    int month = DateTime.parse(ymd).month;

    int year = DateTime.parse(ymd).year;

    int days = int.parse(DateTime.parse(ymd).days);

    return DateTime(year, month, days, 0, 0, 0);
  }
}
