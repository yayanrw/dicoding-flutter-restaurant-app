// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../../features/presentation/pages/favorite_page.dart' as _i7;
import '../../features/presentation/pages/home_page.dart' as _i4;
import '../../features/presentation/pages/intro_page.dart' as _i1;
import '../../features/presentation/pages/restaurant_detail_page.dart' as _i6;
import '../../features/presentation/pages/search_page.dart' as _i5;
import '../../features/presentation/pages/setting_page.dart' as _i8;
import '../../features/presentation/pages/sign_in_page.dart' as _i3;
import '../../features/presentation/pages/under_construction_page.dart' as _i2;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    IntroRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.IntroPage());
    },
    UnderConstructionRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.UnderConstructionPage());
    },
    SignInRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SignInPage());
    },
    HomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomePage());
    },
    SearchRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SearchPage());
    },
    RestaurantDetailRoute.name: (routeData) {
      final args = routeData.argsAs<RestaurantDetailRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.RestaurantDetailPage(key: args.key, id: args.id));
    },
    FavoriteRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.FavoritePage());
    },
    SettingRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.SettingPage());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(IntroRoute.name, path: '/'),
        _i9.RouteConfig(UnderConstructionRoute.name,
            path: '/under-construction'),
        _i9.RouteConfig(SignInRoute.name, path: '/sign-in'),
        _i9.RouteConfig(HomeRoute.name, path: '/home'),
        _i9.RouteConfig(SearchRoute.name, path: '/search'),
        _i9.RouteConfig(RestaurantDetailRoute.name,
            path: '/restaurant-detail/:restaurant'),
        _i9.RouteConfig(FavoriteRoute.name, path: '/favorite'),
        _i9.RouteConfig(SettingRoute.name, path: '/setting')
      ];
}

/// generated route for
/// [_i1.IntroPage]
class IntroRoute extends _i9.PageRouteInfo<void> {
  const IntroRoute() : super(IntroRoute.name, path: '/');

  static const String name = 'IntroRoute';
}

/// generated route for
/// [_i2.UnderConstructionPage]
class UnderConstructionRoute extends _i9.PageRouteInfo<void> {
  const UnderConstructionRoute()
      : super(UnderConstructionRoute.name, path: '/under-construction');

  static const String name = 'UnderConstructionRoute';
}

/// generated route for
/// [_i3.SignInPage]
class SignInRoute extends _i9.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/sign-in');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.SearchPage]
class SearchRoute extends _i9.PageRouteInfo<void> {
  const SearchRoute() : super(SearchRoute.name, path: '/search');

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i6.RestaurantDetailPage]
class RestaurantDetailRoute
    extends _i9.PageRouteInfo<RestaurantDetailRouteArgs> {
  RestaurantDetailRoute({_i10.Key? key, required String id})
      : super(RestaurantDetailRoute.name,
            path: '/restaurant-detail/:restaurant',
            args: RestaurantDetailRouteArgs(key: key, id: id));

  static const String name = 'RestaurantDetailRoute';
}

class RestaurantDetailRouteArgs {
  const RestaurantDetailRouteArgs({this.key, required this.id});

  final _i10.Key? key;

  final String id;

  @override
  String toString() {
    return 'RestaurantDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i7.FavoritePage]
class FavoriteRoute extends _i9.PageRouteInfo<void> {
  const FavoriteRoute() : super(FavoriteRoute.name, path: '/favorite');

  static const String name = 'FavoriteRoute';
}

/// generated route for
/// [_i8.SettingPage]
class SettingRoute extends _i9.PageRouteInfo<void> {
  const SettingRoute() : super(SettingRoute.name, path: '/setting');

  static const String name = 'SettingRoute';
}
