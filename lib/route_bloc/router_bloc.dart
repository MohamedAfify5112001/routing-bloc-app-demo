import 'dart:async';

import 'package:auto_route_demo_app/locator/app_locator.dart';
import 'package:auto_route_demo_app/route_cofig/route_config.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'router_event.dart';

part 'router_state.dart';

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  RouterBloc() : super(RouterInitial()) {
    on<GoToEventRouterScreenEvent>(_onGoToEventRouterScreenEvent);
    on<GoToCategoryRouterScreenEvent>(_onGoToCategoryRouterScreenEvent);
  }

  final getAppRouter = appLocator<AppRouter>();

  Future<void> _onGoToEventRouterScreenEvent(
      GoToEventRouterScreenEvent event, Emitter<RouterState> emit) async {
    getAppRouter.pushNamed('/event');
    emit(GoToEventRouterScreenState());
  }

  Future<void> _onGoToCategoryRouterScreenEvent(
      GoToCategoryRouterScreenEvent event, Emitter<RouterState> emit) async {
    getAppRouter.pushNamed('/category');
    emit(GoToEventRouterScreenState());
  }
}
