// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../data/model/cls_restaurant.dart' as _i9;
import '../../features/presentation/pages/home_page.dart' as _i4;
import '../../features/presentation/pages/intro_page.dart' as _i1;
import '../../features/presentation/pages/restaurant_detail_page.dart' as _i6;
import '../../features/presentation/pages/search_page.dart' as _i5;
import '../../features/presentation/pages/sign_in_page.dart' as _i3;
import '../../features/presentation/pages/under_construction_page.dart' as _i2;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    IntroRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.IntroPage());
    },
    UnderConstructionRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.UnderConstructionPage());
    },
    SignInRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SignInPage());
    },
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomePage());
    },
    SearchRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SearchPage());
    },
    RestaurantDetailRoute.name: (routeData) {
      final args = routeData.argsAs<RestaurantDetailRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.RestaurantDetailPage(
              key: args.key, restaurantDetail: args.restaurantDetail));
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(IntroRoute.name, path: '/'),
        _i7.RouteConfig(UnderConstructionRoute.name,
            path: '/under-construction'),
        _i7.RouteConfig(SignInRoute.name, path: '/sign-in'),
        _i7.RouteConfig(HomeRoute.name, path: '/home'),
        _i7.RouteConfig(SearchRoute.name, path: '/search'),
        _i7.RouteConfig(RestaurantDetailRoute.name,
            path: '/restaurant-detail/:restaurant')
      ];
}

/// generated route for
/// [_i1.IntroPage]
class IntroRoute extends _i7.PageRouteInfo<void> {
  const IntroRoute() : super(IntroRoute.name, path: '/');

  static const String name = 'IntroRoute';
}

/// generated route for
/// [_i2.UnderConstructionPage]
class UnderConstructionRoute extends _i7.PageRouteInfo<void> {
  const UnderConstructionRoute()
      : super(UnderConstructionRoute.name, path: '/under-construction');

  static const String name = 'UnderConstructionRoute';
}

/// generated route for
/// [_i3.SignInPage]
class SignInRoute extends _i7.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/sign-in');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.SearchPage]
class SearchRoute extends _i7.PageRouteInfo<void> {
  const SearchRoute() : super(SearchRoute.name, path: '/search');

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i6.RestaurantDetailPage]
class RestaurantDetailRoute
    extends _i7.PageRouteInfo<RestaurantDetailRouteArgs> {
  RestaurantDetailRoute(
      {_i8.Key? key, required _i9.ClsRestaurantElement restaurantDetail})
      : super(RestaurantDetailRoute.name,
            path: '/restaurant-detail/:restaurant',
            args: RestaurantDetailRouteArgs(
                key: key, restaurantDetail: restaurantDetail));

  static const String name = 'RestaurantDetailRoute';
}

class RestaurantDetailRouteArgs {
  const RestaurantDetailRouteArgs({this.key, required this.restaurantDetail});

  final _i8.Key? key;

  final _i9.ClsRestaurantElement restaurantDetail;

  @override
  String toString() {
    return 'RestaurantDetailRouteArgs{key: $key, restaurantDetail: $restaurantDetail}';
  }
}
