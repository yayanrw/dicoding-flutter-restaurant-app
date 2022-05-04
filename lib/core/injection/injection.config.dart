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
import '../../features/domain/usecases/get_favorite_restaurants.dart' as _i10;
import '../../features/domain/usecases/get_favorite_status.dart' as _i11;
import '../../features/domain/usecases/get_random_restaurant.dart' as _i12;
import '../../features/domain/usecases/get_restaurant_detail.dart' as _i13;
import '../../features/domain/usecases/get_restaurant_search.dart' as _i14;
import '../../features/domain/usecases/get_restaurants.dart' as _i15;
import '../../features/domain/usecases/remove_favorite.dart' as _i17;
import '../../features/domain/usecases/save_favorite.dart' as _i9;
import '../../features/presentation/provider/favorite_restaurants_notifier.dart'
    as _i21;
import '../../features/presentation/provider/random_restaurant_notifier.dart'
    as _i16;
import '../../features/presentation/provider/restaurant_detail_notifier.dart'
    as _i18;
import '../../features/presentation/provider/restaurant_list_notifier.dart'
    as _i19;
import '../../features/presentation/provider/restaurant_search_notifier.dart'
    as _i20;
import 'register_module.dart' as _i22; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i9.SaveFavorite>(
      () => _i9.SaveFavorite(get<_i7.RestaurantRepository>()));
  gh.lazySingleton<_i10.GetFavoriteRestaurants>(
      () => _i10.GetFavoriteRestaurants(get<_i7.RestaurantRepository>()));
  gh.lazySingleton<_i11.GetFavoriteStatus>(
      () => _i11.GetFavoriteStatus(get<_i7.RestaurantRepository>()));
  gh.lazySingleton<_i12.GetRandomRestaurant>(
      () => _i12.GetRandomRestaurant(get<_i7.RestaurantRepository>()));
  gh.lazySingleton<_i13.GetRestaurantDetail>(
      () => _i13.GetRestaurantDetail(get<_i7.RestaurantRepository>()));
  gh.lazySingleton<_i14.GetRestaurantSearch>(
      () => _i14.GetRestaurantSearch(get<_i7.RestaurantRepository>()));
  gh.lazySingleton<_i15.GetRestaurants>(
      () => _i15.GetRestaurants(get<_i7.RestaurantRepository>()));
  gh.factory<_i16.RandomRestaurantNotifier>(
      () => _i16.RandomRestaurantNotifier(get<_i12.GetRandomRestaurant>()));
  gh.lazySingleton<_i17.RemoveFavorite>(
      () => _i17.RemoveFavorite(get<_i7.RestaurantRepository>()));
  gh.factory<_i18.RestaurantDetailNotifier>(() => _i18.RestaurantDetailNotifier(
      get<_i13.GetRestaurantDetail>(),
      get<_i11.GetFavoriteStatus>(),
      get<_i9.SaveFavorite>(),
      get<_i17.RemoveFavorite>()));
  gh.factory<_i19.RestaurantListNotifier>(
      () => _i19.RestaurantListNotifier(get<_i15.GetRestaurants>()));
  gh.factory<_i20.RestaurantSearchNotifier>(
      () => _i20.RestaurantSearchNotifier(get<_i14.GetRestaurantSearch>()));
  gh.factory<_i21.FavoriteRestaurantNotifier>(() =>
      _i21.FavoriteRestaurantNotifier(get<_i10.GetFavoriteRestaurants>()));
  return get;
}

class _$RegisterModule extends _i22.RegisterModule {}
