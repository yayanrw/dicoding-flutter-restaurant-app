import 'package:auto_route/auto_route.dart';
import 'package:restaurant_app/features/others/presentation/pages/intro_page.dart';
import 'package:restaurant_app/features/others/presentation/pages/under_construction_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(initial: true, path: '/', page: IntroPage),
  AutoRoute(path: '/under-construction', page: UnderConstructionPages),
  AutoRoute(path: '/sign-in', page: UnderConstructionPages),
])
class $AppRouter {}
