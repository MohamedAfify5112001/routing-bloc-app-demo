import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hello In Category Screen',
        ),
      ),
      body: Center(
        child: Text(
          'Hello In Category Screen',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 30.0,
              ),
        ),
      ),
    );
  }
}
