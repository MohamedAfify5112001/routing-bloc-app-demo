class StepperSingleton {
  static final StepperSingleton _singleton = StepperSingleton._internal();
  List<int> indexNumbers = [0];

  factory StepperSingleton() {
    return _singleton;
  }

  StepperSingleton._internal();
}
