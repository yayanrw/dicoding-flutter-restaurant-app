// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/domain/usecases/get_restaurant_detail.dart' as _i4;
import '../../features/domain/usecases/get_restaurant_search.dart' as _i8;
import '../../features/domain/usecases/get_restaurants.dart' as _i6;
import '../../features/presentation/provider/restaurant_detail_notifier.dart'
    as _i3;
import '../../features/presentation/provider/restaurant_list_notifier.dart'
    as _i5;
import '../../features/presentation/provider/restaurant_search_notifier.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.RestaurantDetailNotifier>(
      () => _i3.RestaurantDetailNotifier(get<_i4.GetRestaurantDetail>()));
  gh.factory<_i5.RestaurantListNotifier>(
      () => _i5.RestaurantListNotifier(get<_i6.GetRestaurants>()));
  gh.factory<_i7.RestaurantSearchNotifier>(
      () => _i7.RestaurantSearchNotifier(get<_i8.GetRestaurantSearch>()));
  return get;
}
