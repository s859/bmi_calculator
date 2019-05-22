import 'dart:math';

class CalculatorBrain {
  final int height; //cm
  final int weight; //kg

  int bmiValue;

  CalculatorBrain({this.height, this.weight});

  int bmiCalculate() {
    double bmi = weight / pow(height / 100, 2);
    bmiValue = bmi.round();
    return bmiValue;
  }

  String getStatus(int bmi) {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi >= 18 && bmi < 25) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getAdvice(int bmi) {
    if (bmi >= 25) {
      return 'Reduce weight.';
    } else if (bmi >= 18 && bmi < 25) {
      return 'Maintain weight.';
    } else {
      return 'Increase weight.';
    }
  }
}
