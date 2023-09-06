part of 'router_bloc.dart';

sealed class RouterState extends Equatable {
  const RouterState();
}

final class RouterInitial extends RouterState {
  @override
  List<Object> get props => [];
}

final class GoToEventRouterScreenState extends RouterState {
  @override
  List<Object> get props => [];
}

final class GoToCategoryRouterScreenState extends RouterState {
  @override
  List<Object> get props => [];
}
