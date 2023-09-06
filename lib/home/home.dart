import 'package:auto_route/auto_route.dart';
import 'package:auto_route_demo_app/route_bloc/router_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hello In Home Screen',
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context
                    .read<RouterBloc>()
                    .add(const GoToEventRouterScreenEvent(path: '/event'));
              },
              child: const Text(
                'Go To Event Screen',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<RouterBloc>().add(
                    const GoToCategoryRouterScreenEvent(path: '/category'));
              },
              child: const Text(
                'Go To Category Screen',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
