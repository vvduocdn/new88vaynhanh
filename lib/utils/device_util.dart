
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DeviceUtils {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width/375;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height/812;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static bool isIOS() {
    return Platform.isIOS;
  }
}

String formatNumber(int number) {
  final formatter = NumberFormat('#,###,###');
  return formatter.format(number);
}