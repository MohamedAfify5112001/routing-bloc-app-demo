part of 'router_bloc.dart';

sealed class RouterEvent extends Equatable {
  const RouterEvent();
}

final class GoToEventRouterScreenEvent extends RouterEvent {
  final String path;

  const GoToEventRouterScreenEvent({
    required this.path,
  });

  @override
  List<Object> get props => [
        path,
      ];
}

final class GoToCategoryRouterScreenEvent extends RouterEvent {
  final String path;

  const GoToCategoryRouterScreenEvent({
    required this.path,
  });

  @override
  List<Object> get props => [
        path,
      ];
}
