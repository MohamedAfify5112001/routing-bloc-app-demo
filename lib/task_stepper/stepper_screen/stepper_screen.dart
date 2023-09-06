import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../custom_stepper/custom_stepper_widget.dart';

class StepperScreen extends StatefulWidget {
  const StepperScreen({super.key});

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
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
      body: const CustomStepper(),
    );
  }
}
