// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i10;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/data/datasources/restaurant_remote_datasource.dart'
    as _i9;
import '../../features/data/repositories/restaurant_repository_impl.dart'
    as _i11;
import '../../features/domain/repositories/restaurant_repository.dart' as _i4;
import '../../features/domain/usecases/get_restaurant_detail.dart' as _i3;
import '../../features/domain/usecases/get_restaurant_search.dart' as _i5;
import '../../features/domain/usecases/get_restaurants.dart' as _i6;
import '../../features/presentation/provider/restaurant_detail_notifier.dart'
    as _i7;
import '../../features/presentation/provider/restaurant_list_notifier.dart'
    as _i8;
import '../../features/presentation/provider/restaurant_search_notifier.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.GetRestaurantDetail>(
      () => _i3.GetRestaurantDetail(get<_i4.RestaurantRepository>()));
  gh.lazySingleton<_i5.GetRestaurantSearch>(
      () => _i5.GetRestaurantSearch(get<_i4.RestaurantRepository>()));
  gh.lazySingleton<_i6.GetRestaurants>(
      () => _i6.GetRestaurants(get<_i4.RestaurantRepository>()));
  gh.factory<_i7.RestaurantDetailNotifier>(
      () => _i7.RestaurantDetailNotifier(get<_i3.GetRestaurantDetail>()));
  gh.factory<_i8.RestaurantListNotifier>(
      () => _i8.RestaurantListNotifier(get<_i6.GetRestaurants>()));
  gh.lazySingleton<_i9.RestaurantRemoteDataSource>(
      () => _i9.RestaurantRemoteDataSourceImpl(get<_i10.Client>()));
  gh.lazySingleton<_i11.RestaurantRepositoryImpl>(() =>
      _i11.RestaurantRepositoryImpl(
          remoteDataSource: get<_i9.RestaurantRemoteDataSource>()));
  gh.factory<_i12.RestaurantSearchNotifier>(
      () => _i12.RestaurantSearchNotifier(get<_i5.GetRestaurantSearch>()));
  return get;
}
