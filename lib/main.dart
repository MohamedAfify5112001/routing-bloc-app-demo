import 'package:auto_route_demo_app/route_bloc/router_bloc.dart';
import 'package:auto_route_demo_app/route_cofig/route_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'locator/app_locator.dart';
import 'observer/bloc_observer.dart';

void main() async {
  await initAppLocator();
  Bloc.observer = const SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appLocator<RouterBloc>(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appLocator<AppRouter>().config(),
        theme: ThemeData(
          useMaterial3: true,
        ),
      ),
    );
  }
}
