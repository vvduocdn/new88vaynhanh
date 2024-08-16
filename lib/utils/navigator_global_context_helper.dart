import 'package:flutter/material.dart';
import 'package:new88_vaynow/services/di/locator.dart';

final NavigatorGlobalContextHelper navigationService = locator.get<NavigatorGlobalContextHelper>();

class NavigatorGlobalContextHelper {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get getCurrentContext => navigatorKey.currentState!.overlay!.context;
}
