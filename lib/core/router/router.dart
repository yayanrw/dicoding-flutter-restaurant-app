import 'package:auto_route/auto_route.dart';
import 'package:restaurant_app/features/others/presentation/pages/intro_page.dart';
import 'package:restaurant_app/features/others/presentation/pages/under_construction_page.dart';
import 'package:restaurant_app/features/sign_in/presentation/pages/sign_in_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(initial: true, path: '/', page: IntroPage),
  AutoRoute(path: '/under-construction', page: UnderConstructionPage),
  AutoRoute(path: '/sign-in', page: SignInPage),
])
class $AppRouter {}
