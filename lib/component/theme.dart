import 'package:flutter/material.dart';

class AppColors {
  const AppColors(
      {required this.background,
      required this.white,
      required this.black,
      required this.text,
      required this.main,
      required this.activeMain,
      required this.hE0E0E0,
      required this.hDA251D,
      required this.hF0F5FF,
      required this.hFFFF00,
      required this.h838383,
      required this.h598FF9,
      required this.hEC7905,
      required this.hFFF2E5,
      required this.hFFE500,
      required this.hEB4335,
      required this.hEFEFEF,
      required this.hFFCB45,
      required this.h38B8D1,
      required this.hF05D0E,
      required this.h54CA92});

  final Color background;
  final Color white;
  final Color text;
  final Color main;
  final Color activeMain;
  final Color hE0E0E0;
  final Color hDA251D;
  final Color hFFFF00;
  final Color hF0F5FF;
  final Color h838383;
  final Color black;
  final Color hEB4335;
  final Color h598FF9;
  final Color hEC7905;
  final Color hFFF2E5;
  final Color hFFE500;
  final Color hEFEFEF;
  final Color h54CA92;
  final Color hFFCB45;
  final Color h38B8D1;
  final Color hF05D0E;
}

const AppColors colorsLight = AppColors(
    background: Color(0xFFFAFAFA),
    white: Color(0xFFFFFFFF),
    text: Color(0xFF000000),
    activeMain: Color(0xFF598FF9),
    main: Color(0xFF888888),
    hE0E0E0: Color(0xFFE0E0E0),
    hDA251D: Color(0xFFDA251D),
    hEB4335: Color(0xFFEB4335),
    hFFFF00: Color(0xFFFFFF00),
    hF0F5FF: Color(0xFFF0F5FF),
    h838383: Color(0xFF838383),
    black: Color(0xFF000000),
    hEC7905: Color(0xFFEC7905),
    h598FF9: Color(0xFF598FF9),
    hFFE500: Color(0xFFFFE500),
    hEFEFEF: Color(0xFFEFEFEF),
    hFFF2E5: Color(0xFFFFF2E5),
    hFFCB45: Color(0xFFFFCB45),
    h38B8D1: Color(0xFF38B8D1),
    hF05D0E: Color(0xFFF05D0E),
    h54CA92: Color((0xFF54CA92)));

const AppColors colorsDark = AppColors(
    background: Color(0xFF212121),
    white: Color(0xFFFFFFFF),
    text: Color(0xFFF6F3F3),
    activeMain: Color(0xFF598FF9),
    main: Color(0xFF888888),
    hE0E0E0: Color(0xFFE0E0E0),
    hDA251D: Color(0xFFDA251D),
    hFFFF00: Color(0xFFFFFF00),
    hF0F5FF: Color(0xFFF0F5FF),
    h838383: Color(0xFF838383),
    black: Color(0xFF000000),
    hEB4335: Color(0xFFEB4335),
    h598FF9: Color(0xFF598FF9),
    hEC7905: Color(0xFFEC7905),
    hFFE500: Color(0xFFFFE500),
    hEFEFEF: Color(0xFFEFEFEF),
    hFFF2E5: Color(0xFFFFF2E5),
    hFFCB45: Color(0xFFFFCB45),
    h38B8D1: Color(0xFF38B8D1),
    hF05D0E: Color(0xFFF05D0E),
    h54CA92: Color((0xFF54CA92)));

extension AppColorsExtension on BuildContext {
  AppColors get colors {
    final Brightness brightness = Theme.of(this).brightness;
    switch (brightness) {
      case Brightness.light:
        return colorsLight;
      case Brightness.dark:
        return colorsDark;
    }
  }
}
