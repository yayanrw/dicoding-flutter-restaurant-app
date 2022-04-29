// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/data/datasources/db/database_helper.dart' as _i4;
import '../../features/data/datasources/restaurant_local_datasource.dart'
    as _i5;
import '../../features/data/datasources/restaurant_remote_datasource.dart'
    as _i6;
import '../../features/data/repositories/restaurant_repository_impl.dart'
    as _i8;
import '../../features/domain/repositories/restaurant_repository.dart' as _i7;
import '../../features/domain/usecases/get_restaurant_detail.dart' as _i9;
import '../../features/domain/usecases/get_restaurant_search.dart' as _i10;
import '../../features/domain/usecases/get_restaurants.dart' as _i11;
import '../../features/presentation/provider/restaurant_detail_notifier.dart'
    as _i12;
import '../../features/presentation/provider/restaurant_list_notifier.dart'
    as _i13;
import '../../features/presentation/provider/restaurant_search_notifier.dart'
    as _i14;
import 'register_module.dart' as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Client>(() => registerModule.httpClient);
  gh.lazySingleton<_i4.DatabaseHelper>(() => _i4.DatabaseHelper());
  gh.lazySingleton<_i5.RestaurantLocalDataSource>(() =>
      _i5.RestaurantLocalDataSourceImpl(
          databaseHelper: get<_i4.DatabaseHelper>()));
  gh.lazySingleton<_i6.RestaurantRemoteDataSource>(
      () => _i6.RestaurantRemoteDataSourceImpl(get<_i3.Client>()));
  gh.lazySingleton<_i7.RestaurantRepository>(() => _i8.RestaurantRepositoryImpl(
      remoteDataSource: get<_i6.RestaurantRemoteDataSource>(),
      localDataSource: get<_i5.RestaurantLocalDataSource>()));
  gh.lazySingleton<_i9.GetRestaurantDetail>(
      () => _i9.GetRestaurantDetail(get<_i7.RestaurantRepository>()));
  gh.lazySingleton<_i10.GetRestaurantSearch>(
      () => _i10.GetRestaurantSearch(get<_i7.RestaurantRepository>()));
  gh.lazySingleton<_i11.GetRestaurants>(
      () => _i11.GetRestaurants(get<_i7.RestaurantRepository>()));
  gh.factory<_i12.RestaurantDetailNotifier>(
      () => _i12.RestaurantDetailNotifier(get<_i9.GetRestaurantDetail>()));
  gh.factory<_i13.RestaurantListNotifier>(
      () => _i13.RestaurantListNotifier(get<_i11.GetRestaurants>()));
  gh.factory<_i14.RestaurantSearchNotifier>(
      () => _i14.RestaurantSearchNotifier(get<_i10.GetRestaurantSearch>()));
  return get;
}

class _$RegisterModule extends _i15.RegisterModule {}
