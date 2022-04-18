import 'package:auto_route/auto_route.dart';
import 'package:restaurant_app/features/presentation/pages/home_page.dart';
import 'package:restaurant_app/features/presentation/pages/intro_page.dart';
import 'package:restaurant_app/features/presentation/pages/restaurant_detail_page.dart';
import 'package:restaurant_app/features/presentation/pages/search_page.dart';
import 'package:restaurant_app/features/presentation/pages/sign_in_page.dart';
import 'package:restaurant_app/features/presentation/pages/under_construction_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(initial: true, path: '/', page: IntroPage),
  AutoRoute(path: '/under-construction', page: UnderConstructionPage),
  AutoRoute(path: '/sign-in', page: SignInPage),
  AutoRoute(path: '/home', page: HomePage),
  AutoRoute(path: '/search', page: SearchPage),
  AutoRoute(path: '/restaurant-detail/:restaurant', page: RestaurantDetailPage)
])
class $AppRouter {}
