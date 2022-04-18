import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/core/injection/injection.config.dart';
import 'package:http/http.dart' as http;

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection(String env) {
  getIt.registerLazySingleton(() => http.Client);
  $initGetIt(getIt, environment: env);
}
