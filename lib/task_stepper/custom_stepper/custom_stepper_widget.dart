import 'dart:developer';

import 'package:auto_route_demo_app/task_stepper/helper/stepper_singleton.dart';
import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({Key? key}) : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  var indexNumbers = StepperSingleton().indexNumbers;
  final List<String> titles = [
    'Info',
    'Unit',
    'Files',
    'Family',
    'Cars',
  ];

  @override
  Widget build(BuildContext context) {
    log('Hello Index ${StepperSingleton().indexNumbers}');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //let's add some padding press alt enter
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 19.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                  color: Color.fromRGBO(217, 217, 217, 1.0), width: 4),
            ),
          ),
          child: Row(
            children: List.generate(
              titles.length,
              (index) => StepperComponent(
                index: index,
                onTap: () {
                  if (index != 0 &&
                      !StepperSingleton().indexNumbers.contains(index)) {
                    log(' Current Index $index}');
                    bool isAllPrevItemFindInList = false;
                    for (int i = index; i >= 1; i--) {
                      if (StepperSingleton().indexNumbers.contains(i - 1)) {
                        isAllPrevItemFindInList = true;
                      } else {
                        isAllPrevItemFindInList = false;
                        break;
                      }
                    }
                    log('isAllPrevItemFindInList $isAllPrevItemFindInList}');
                    if (isAllPrevItemFindInList) {
                      setState(() {
                        StepperSingleton().indexNumbers.add(index);
                      });
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(
                          milliseconds: 600,
                        ),
                        curve: Curves.easeInOut,
                      );
                    }
                  } else if (StepperSingleton().indexNumbers.contains(index)) {
                    if (index != 0) {
                      setState(
                        () {
                          if (StepperSingleton().indexNumbers.length >
                              index + 1) {
                            //2 > 2
                            for (int i = index + 1; i < titles.length; i++) {
                              StepperSingleton().indexNumbers.remove(i);
                            }
                          } else {
                            StepperSingleton().indexNumbers.remove(index);
                          }
                        },
                      );
                      if (StepperSingleton().indexNumbers.contains(index)) {
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(
                            milliseconds: 600,
                          ),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        _pageController.animateToPage(
                          index - 1,
                          duration: const Duration(
                            milliseconds: 600,
                          ),
                          curve: Curves.easeInOut,
                        );
                      }
                    } else {
                      setState(() {
                        if (StepperSingleton().indexNumbers.length > 1) {
                          for (int i = index + 1; i < titles.length; i++) {
                            StepperSingleton().indexNumbers.remove(i);
                          }
                        } else {
                          StepperSingleton().indexNumbers.remove(index + 1);
                        }
                      });
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(
                          milliseconds: 600,
                        ),
                        curve: Curves.easeInOut,
                      );
                    }
                  }
                },
                title: titles[index],
                isLast: index == titles.length - 1 ? true : false,
              ),
            ),
          ),
        ),
        Expanded(
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Center(
                child: Text(
                  'Page ${titles[index]}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 30.0),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class StepperComponent extends StatelessWidget {
  // index describe the position of our bubble
  final int index;

  final List<int> numbers = List.generate(6, (index) => index);

  //onTap CallBack
  final VoidCallback onTap;

  final bool isLast;
  final String title;

  StepperComponent({
    super.key,
    required this.index,
    required this.onTap,
    this.isLast = false,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return isLast
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  //this is the bubble
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: StepperSingleton().indexNumbers.contains(index)
                            ? const Color.fromRGBO(114, 16, 255, 1.0)
                            : const Color.fromRGBO(217, 217, 217, 1.0),
                      ),
                      child: Center(
                        child: Text(
                          '${numbers[index + 1]}',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color:
                                StepperSingleton().indexNumbers.contains(index)
                                    ? Colors.white
                                    : const Color.fromRGBO(152, 152, 152, 1.0),
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      height: 2,
                      color: const Color.fromRGBO(217, 217, 217, 1.0)),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(title, style: _buildTextStyle()),
            ],
          )
        : Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    //this is the bubble
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: StepperSingleton().indexNumbers.contains(index)
                              ? const Color.fromRGBO(114, 16, 255, 1.0)
                              : const Color.fromRGBO(217, 217, 217, 1.0),
                        ),
                        child: Center(
                          child: Text(
                            '${numbers[index] + 1}',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: StepperSingleton()
                                      .indexNumbers
                                      .contains(index)
                                  ? Colors.white
                                  : const Color.fromRGBO(152, 152, 152, 1.0),
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //this the ligne
                    Expanded(
                      child: Container(
                        height: 2,
                        color: const Color.fromRGBO(217, 217, 217, 1.0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  title,
                  style: _buildTextStyle(),
                ),
              ],
            ),
          );
  }

  TextStyle _buildTextStyle() => const TextStyle(
      color: Color.fromRGBO(
        34,
        34,
        34,
        1.0,
      ),
      fontWeight: FontWeight.w600);
}
