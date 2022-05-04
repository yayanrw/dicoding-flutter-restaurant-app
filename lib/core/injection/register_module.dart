import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/core/router/router.gr.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  http.Client get httpClient => http.Client();

  @singleton
  AppRouter get appRouter => AppRouter();
}
