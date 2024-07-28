
import 'dart:io';
import 'package:flutter/material.dart';

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