import 'package:get_it/get_it.dart';
import 'package:vaynow_flutter/services/api/api_client.dart';
import 'package:vaynow_flutter/utils/navigator_global_context_helper.dart';


GetIt locator = GetIt.instance;

void setUpInjector() {
  locator.registerLazySingleton(() => ApiClient());
  locator.registerLazySingleton(() => NavigatorGlobalContextHelper());
}
