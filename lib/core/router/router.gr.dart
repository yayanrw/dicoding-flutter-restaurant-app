// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../features/others/presentation/pages/intro_page.dart' as _i1;
import '../../features/others/presentation/pages/under_construction_page.dart'
    as _i2;
import '../../features/sign_in/presentation/pages/sign_in_page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    IntroRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.IntroPage());
    },
    UnderConstructionRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.UnderConstructionPage());
    },
    SignInRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SignInPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(IntroRoute.name, path: '/'),
        _i4.RouteConfig(UnderConstructionRoute.name,
            path: '/under-construction'),
        _i4.RouteConfig(SignInRoute.name, path: '/sign-in')
      ];
}

/// generated route for
/// [_i1.IntroPage]
class IntroRoute extends _i4.PageRouteInfo<void> {
  const IntroRoute() : super(IntroRoute.name, path: '/');

  static const String name = 'IntroRoute';
}

/// generated route for
/// [_i2.UnderConstructionPage]
class UnderConstructionRoute extends _i4.PageRouteInfo<void> {
  const UnderConstructionRoute()
      : super(UnderConstructionRoute.name, path: '/under-construction');

  static const String name = 'UnderConstructionRoute';
}

/// generated route for
/// [_i3.SignInPage]
class SignInRoute extends _i4.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/sign-in');

  static const String name = 'SignInRoute';
}
