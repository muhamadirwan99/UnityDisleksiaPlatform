import 'package:get_it/get_it.dart';
import 'package:unity_disleksia_platform/services/analytics_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AnalyticsService());
}
