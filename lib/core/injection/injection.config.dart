// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// Ignore issues from commonly used lints in this file.
// ignore_for_file:implementation_imports, file_names, unnecessary_new,
//ignore_for_file: unused_import, annotate_overrides, unnecessary_string_escapes
// ignore_for_file: require_trailing_commas, prefer_final_locals
// ignore_for_file:unnecessary_brace_in_string_interps, directives_ordering
// ignore_for_file:argument_type_not_assignable, invalid_assignment
// ignore_for_file:prefer_single_quotes, prefer_generic_function_type_aliases
// ignore_for_file:comment_references
// ignore_for_file: always_specify_types, depend_on_referenced_packages,
// ignore_for_file: always_use_package_imports
// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

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
import '../../features/domain/usecases/get_favorite_restaurants.dart' as _i12;
import '../../features/domain/usecases/get_favorite_status.dart' as _i13;
import '../../features/domain/usecases/get_random_restaurant.dart' as _i14;
import '../../features/domain/usecases/get_restaurant_detail.dart' as _i15;
import '../../features/domain/usecases/get_restaurant_search.dart' as _i16;
import '../../features/domain/usecases/get_restaurants.dart' as _i17;
import '../../features/domain/usecases/remove_favorite.dart' as _i19;
import '../../features/domain/usecases/save_favorite.dart' as _i10;
import '../../features/presentation/provider/favorite_restaurants_notifier.dart'
    as _i23;
import '../../features/presentation/provider/random_restaurant_notifier.dart'
    as _i18;
import '../../features/presentation/provider/restaurant_detail_notifier.dart'
    as _i20;
import '../../features/presentation/provider/restaurant_list_notifier.dart'
    as _i21;
import '../../features/presentation/provider/restaurant_search_notifier.dart'
    as _i22;
import '../../features/presentation/provider/schedulling_notifier.dart' as _i11;
import '../router/router.gr.dart' as _i3;
import 'register_module.dart' as _i24; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i11.SchedullingNotifier>(() => _i11.SchedullingNotifier());
  gh.lazySingleton<_i12.GetFavoriteRestaurants>(
      () => _i12.GetFavoriteRestaurants(get<_i8.RestaurantRepository>()));
  gh.lazySingleton<_i13.GetFavoriteStatus>(
      () => _i13.GetFavoriteStatus(get<_i8.RestaurantRepository>()));
  gh.lazySingleton<_i14.GetRandomRestaurant>(
      () => _i14.GetRandomRestaurant(get<_i8.RestaurantRepository>()));
  gh.lazySingleton<_i15.GetRestaurantDetail>(
      () => _i15.GetRestaurantDetail(get<_i8.RestaurantRepository>()));
  gh.lazySingleton<_i16.GetRestaurantSearch>(
      () => _i16.GetRestaurantSearch(get<_i8.RestaurantRepository>()));
  gh.lazySingleton<_i17.GetRestaurants>(
      () => _i17.GetRestaurants(get<_i8.RestaurantRepository>()));
  gh.factory<_i18.RandomRestaurantNotifier>(
      () => _i18.RandomRestaurantNotifier(get<_i14.GetRandomRestaurant>()));
  gh.lazySingleton<_i19.RemoveFavorite>(
      () => _i19.RemoveFavorite(get<_i8.RestaurantRepository>()));
  gh.factory<_i20.RestaurantDetailNotifier>(() => _i20.RestaurantDetailNotifier(
      get<_i15.GetRestaurantDetail>(),
      get<_i13.GetFavoriteStatus>(),
      get<_i10.SaveFavorite>(),
      get<_i19.RemoveFavorite>()));
  gh.factory<_i21.RestaurantListNotifier>(
      () => _i21.RestaurantListNotifier(get<_i17.GetRestaurants>()));
  gh.factory<_i22.RestaurantSearchNotifier>(
      () => _i22.RestaurantSearchNotifier(get<_i16.GetRestaurantSearch>()));
  gh.factory<_i23.FavoriteRestaurantNotifier>(() =>
      _i23.FavoriteRestaurantNotifier(get<_i12.GetFavoriteRestaurants>()));
  return get;
}

class _$RegisterModule extends _i24.RegisterModule {}
