import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hello In Event Screen',
        ),
      ),
      body: Center(
        child: Text(
          'Hello In Event Screen',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontSize: 30.0,
          ),
        ),
      ),

    );
  }
}
