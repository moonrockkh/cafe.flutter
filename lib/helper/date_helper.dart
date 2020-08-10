import 'package:cafeshop/scoped_model/app_scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scoped_model/scoped_model.dart';

final dollarFormat = NumberFormat("#,##0.00", "en_US");
final dateFormatddMMyyy = DateFormat('dd-MM-yyyy');
final dateFormatYYYMMdd = DateFormat('yyyy-MM-dd');
final dateFormatddMMMyyy = DateFormat('dd-MMM-yyyy');
final timeFormatHHMMA = new DateFormat('hh:mm:ss a');

String formatDate(String date) {
  try {
    return dateFormatddMMyyy.format(dateFormatddMMyyy.parse(date));
  } catch (Exception) {
    return "";
  }
}

String format(DateTime date, DateFormat formater) {
  try {
    return formater.format(date);
  } catch (Exception) {
    return "";
  }
}

String getTimeOnly(String date) {
  List<String> splitter = date.split(" ");
  if (splitter.length < 3) {
    return date;
  }
  return splitter[1] + " " + splitter[2];
}

class DateHelper {
  static final dateFormatddMMyyy = DateFormat('dd-MM-yyyy');
  static final dateFormatMMddyyy = DateFormat('MM-dd-yyyy');
  static final dateFormatMMMyyy = DateFormat('MMM-yyyy');
  static final dateFormatYYYMMdd = DateFormat('yyyy-MM-dd');
  static final timeFormatHHMMA = new DateFormat('hh:mm:ss a');
  static final timeFormatddMMyyyHHMMA = new DateFormat('dd-MM-yyyy hh:mm:ss a');
  static final sqlFormatddMMyyyHHMMA = new DateFormat('yyyy-mm-dd hh:mm:ss');
  static final dateFormatddMMyyySlash = DateFormat('dd/MM/yyyy');
  static final timeFormatddMMyyyHHMMSSA = new DateFormat('dd-MM-yyyy hh:mm:ss a');
  

  static String format(DateTime date, DateFormat formater) {
    try {
      return formater.format(date);
    } catch (Exception) {
      return "";
    }
  }

  static String formatLocalMonthYear(BuildContext context, String date) {
    Locale appLocale = ScopedModel.of<AppScopedModel>(context).appLocal;
    return DateFormat('MMM yyyy', appLocale.toString()).format(DateTime.parse(date));
  }

  static DateTime getDate(String dateLabel, DateFormat formater) {
    try {
      return formater.parse(dateLabel);
    } catch (Exception) {
      return null;
    }
  }

  /*
   * 
   */
  static String getTimeOnly(String date) {
    List<String> splitter = date.split(" ");
    if (splitter.length < 3) {
      return date;
    }
    return splitter[1] + " " + splitter[2];
  }

  /*
   * 
   */
  static DateTime getFirstDateOfTheMonth(DateTime now) {
    return new DateTime(now.year, now.month, 1);
  }

  /*
   * 
   */
  static DateTime getLastDateOfTheMonth(DateTime now) {
    var beginningNextMonth = (now.month < 12) ? new DateTime(now.year, now.month + 1, 1) : new DateTime(now.year + 1, 1, 1);
    var lastDay = beginningNextMonth.subtract(new Duration(days: 1)).day;
    return new DateTime(now.year, now.month, lastDay);
  }

  static DateTime getDatePlusSecond(DateTime now, int second) {
    return now.add(Duration(seconds: second));
  }
}