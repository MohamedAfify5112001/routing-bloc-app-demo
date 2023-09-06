import 'package:auto_route_demo_app/route_bloc/router_bloc.dart';
import 'package:get_it/get_it.dart';

import '../route_cofig/route_config.dart';

final appLocator = GetIt.I;

Future<void> initAppLocator() async {
  appLocator.registerSingleton<AppRouter>(AppRouter());
  appLocator.registerFactory<RouterBloc>(() => RouterBloc());
}
