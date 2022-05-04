// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/data/datasources/db/database_helper.dart' as _i5;
import '../../features/data/datasources/restaurant_local_datasource.dart'
    as _i6;
import '../../features/data/datasources/restaurant_remote_datasource.dart'
    as _i7;
import '../../features/data/repositories/restaurant_repository_impl.dart'
    as _i9;
import '../../features/domain/repositories/restaurant_repository.dart' as _i8;
import '../../features/domain/usecases/get_favorite_restaurants.dart' as _i11;
import '../../features/domain/usecases/get_favorite_status.dart' as _i12;
import '../../features/domain/usecases/get_random_restaurant.dart' as _i13;
import '../../features/domain/usecases/get_restaurant_detail.dart' as _i14;
import '../../features/domain/usecases/get_restaurant_search.dart' as _i15;
import '../../features/domain/usecases/get_restaurants.dart' as _i16;
import '../../features/domain/usecases/remove_favorite.dart' as _i18;
import '../../features/domain/usecases/save_favorite.dart' as _i10;
import '../../features/presentation/provider/favorite_restaurants_notifier.dart'
    as _i22;
import '../../features/presentation/provider/random_restaurant_notifier.dart'
    as _i17;
import '../../features/presentation/provider/restaurant_detail_notifier.dart'
    as _i19;
import '../../features/presentation/provider/restaurant_list_notifier.dart'
    as _i20;
import '../../features/presentation/provider/restaurant_search_notifier.dart'
    as _i21;
import '../router/router.gr.dart' as _i3;
import 'register_module.dart' as _i23; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.AppRouter>(registerModule.appRouter);
  gh.lazySingleton<_i4.Client>(() => registerModule.httpClient);
  gh.lazySingleton<_i5.DatabaseHelper>(() => _i5.DatabaseHelper());
  gh.lazySingleton<_i6.RestaurantLocalDataSource>(() =>
      _i6.RestaurantLocalDataSourceImpl(
          databaseHelper: get<_i5.DatabaseHelper>()));
  gh.lazySingleton<_i7.RestaurantRemoteDataSource>(
      () => _i7.RestaurantRemoteDataSourceImpl(get<_i4.Client>()));
  gh.lazySingleton<_i8.RestaurantRepository>(() => _i9.RestaurantRepositoryImpl(
      remoteDataSource: get<_i7.RestaurantRemoteDataSource>(),
      localDataSource: get<_i6.RestaurantLocalDataSource>()));
  gh.lazySingleton<_i10.SaveFavorite>(
      () => _i10.SaveFavorite(get<_i8.RestaurantRepository>()));
  gh.lazySingleton<_i11.GetFavoriteRestaurants>(
      () => _i11.GetFavoriteRestaurants(get<_i8.RestaurantRepository>()));
  gh.lazySingleton<_i12.GetFavoriteStatus>(
      () => _i12.GetFavoriteStatus(get<_i8.RestaurantRepository>()));
  gh.lazySingleton<_i13.GetRandomRestaurant>(
      () => _i13.GetRandomRestaurant(get<_i8.RestaurantRepository>()));
  gh.lazySingleton<_i14.GetRestaurantDetail>(
      () => _i14.GetRestaurantDetail(get<_i8.RestaurantRepository>()));
  gh.lazySingleton<_i15.GetRestaurantSearch>(
      () => _i15.GetRestaurantSearch(get<_i8.RestaurantRepository>()));
  gh.lazySingleton<_i16.GetRestaurants>(
      () => _i16.GetRestaurants(get<_i8.RestaurantRepository>()));
  gh.factory<_i17.RandomRestaurantNotifier>(
      () => _i17.RandomRestaurantNotifier(get<_i13.GetRandomRestaurant>()));
  gh.lazySingleton<_i18.RemoveFavorite>(
      () => _i18.RemoveFavorite(get<_i8.RestaurantRepository>()));
  gh.factory<_i19.RestaurantDetailNotifier>(() => _i19.RestaurantDetailNotifier(
      get<_i14.GetRestaurantDetail>(),
      get<_i12.GetFavoriteStatus>(),
      get<_i10.SaveFavorite>(),
      get<_i18.RemoveFavorite>()));
  gh.factory<_i20.RestaurantListNotifier>(
      () => _i20.RestaurantListNotifier(get<_i16.GetRestaurants>()));
  gh.factory<_i21.RestaurantSearchNotifier>(
      () => _i21.RestaurantSearchNotifier(get<_i15.GetRestaurantSearch>()));
  gh.factory<_i22.FavoriteRestaurantNotifier>(() =>
      _i22.FavoriteRestaurantNotifier(get<_i11.GetFavoriteRestaurants>()));
  return get;
}

class _$RegisterModule extends _i23.RegisterModule {}
