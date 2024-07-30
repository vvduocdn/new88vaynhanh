import 'package:get_it/get_it.dart';
import 'package:new88_vaynow/services/api/api_client.dart';
import 'package:new88_vaynow/utils/navigator_global_context_helper.dart';


GetIt locator = GetIt.instance;

void setUpInjector() {
  locator.registerLazySingleton(() => ApiClient());
  locator.registerLazySingleton(() => NavigatorGlobalContextHelper());
}
