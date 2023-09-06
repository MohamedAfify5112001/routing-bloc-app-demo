import 'package:auto_route/auto_route.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeStep = 0;
  int activeStep2 = 0;
  int reachedStep = 0;
  int upperBound = 5;
  Set<int> reachedSteps = <int>{0, 2, 4, 5};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: SvgPicture.asset(
          'assets/images/Iconsax_Linear_arrowleft.svg',
          fit: BoxFit.scaleDown,
        ),
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: [
          Container(
            width: 32.0,
            height: 32.0,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.black),
            child: const Icon(Icons.add, size: 16, color: Colors.white),
          ),
          const SizedBox(
            width: 16.0,
          )
        ],
      ),
    );
  }
}
/**
 *
 * Theme(
    data: ThemeData(
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.light(primary: Colors.white),
    canvasColor: Colors.white,
    ),
    child: Container(
    decoration: const BoxDecoration(
    border: Border(
    bottom: BorderSide(
    color: Color.fromRGBO(
    217,
    217,
    217,
    1,
    ),
    ),
    ),
    ),
    child: Stepper(
    controlsBuilder: (context, controller) {
    return const SizedBox.shrink();
    },
    elevation: 0.0,
    steps: getSteps(),
    type: StepperType.horizontal,
    ),
    ),
    )
 * */
/**
 *   List<Step> getSteps() => [
    Step(
    title: Text('1'),
    label: Text('Info'),
    content: Container(),
    ),
    Step(
    title: Text('1'),
    label: Text('Info'),
    content: Container(),
    ),
    Step(
    title: Text('1'),
    label: Text('Info'),
    content: Container(),
    ),
    Step(
    title: Text('1'),
    label: Text('Info'),
    content: Container(),
    ),
    Step(
    title: Text('1'),
    label: Text('Info'),
    content: Container(),
    ),
    ];

 * */
