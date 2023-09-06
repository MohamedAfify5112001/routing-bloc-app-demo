import 'package:auto_route/auto_route.dart';
import 'package:auto_route_demo_app/route_cofig/route_config.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          path: '/home',
        ),
        AutoRoute(
          page: EventRoute.page,
          path: '/event',
        ),
        AutoRoute(
          page: CategoryRoute.page,
          path: '/category',
        ),
      ];
}
