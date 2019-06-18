import 'Constants.dart';

class CalculatorBrain {
  final int height; //inches
  final int weight; //lbs

  int bmiValue;

  CalculatorBrain({this.height, this.weight});

  int bmiCalculate() {
    //double bmi = weight / pow(height / 100, 2);
    double bmi = (weight / height / height) * 703;
    bmiValue = bmi.round();
    return bmiValue;
  }

  String getStatus(int bmi) {
    if (bmi >= 30) {
      return 'Obese';
    } else if (bmi > 25 && bmi < 30) {
      return 'Overweight';
    } else if (bmi >= 18 && bmi <= 25) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getAdvice(int bmi, String gender, int height) {
    int idealWeight;
    String weightStr;
    String idealWeightMsg;

    if (gender == 'M') {
      if (height < 60) {
        idealWeight = 106 - ((60 - height) * 2);
      } else {
        idealWeight = 106 + ((height - 60) * 6);
      }
      weightStr = idealWeight.toString();
      idealWeightMsg =
          ' - ideal weight for a male of your height is $weightStr lbs.';
    } else {
      // female
      if (height < 60) {
        idealWeight = 100 - ((60 - height) * 2);
      } else {
        idealWeight = 100 + ((height - 60) * 5);
      }
      weightStr = idealWeight.toString();
      idealWeightMsg =
          ' - ideal weight for a female of your height is $weightStr lbs.';
    }

    if (bmi > 25) {
      return 'Advice: Reduce weight' + idealWeightMsg;
    } else if (bmi >= 18 && bmi <= 25) {
      return 'Advice: Maintain weight' + idealWeightMsg;
    } else {
      return 'Advice: Increase weight' + idealWeightMsg;
    }
  }

  String getRange(String gender, int height) {
    // We have to add an inch of height, as the MetLife measurement assumes
    // you have on shoes with 1" heels.

    String weightFromTable;
    String rangeMsg;

    if (gender == 'M') {
      if (height < 61 || height > 75) {
        rangeMsg = "Unavailable for your height.";
      } else {
        weightFromTable = maleWeightRange[height + 1][0];
        rangeMsg = "Small frame $weightFromTable lbs, ";
        weightFromTable = maleWeightRange[height + 1][1];
        rangeMsg = rangeMsg + "medium $weightFromTable lbs, ";
        weightFromTable = maleWeightRange[height + 1][2];
        rangeMsg = rangeMsg + "large $weightFromTable lbs.";
      }
    } else {
      // female
      if (height < 57 || height > 71) {
        rangeMsg = "Unavailable for your height.";
      } else {
        weightFromTable = femaleWeightRange[height + 1][0];
        rangeMsg = "Small frame $weightFromTable lbs, ";
        weightFromTable = femaleWeightRange[height + 1][1];
        rangeMsg = rangeMsg + "medium $weightFromTable lbs, ";
        weightFromTable = femaleWeightRange[height + 1][2];
        rangeMsg = rangeMsg + "large $weightFromTable lbs.";
      }
    }
    return rangeMsg;
  }
}
