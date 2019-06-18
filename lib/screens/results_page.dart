import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/ReusableCard.dart';
import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/CalculatorBrain.dart';

class ResultsPage extends StatelessWidget {
  final int bmi;
  final String gender;
  final int height;

  final CalculatorBrain _calculatorBrain = CalculatorBrain();

  ResultsPage({this.bmi, this.gender, this.height});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
//          Container(
//            margin: EdgeInsets.all(15.0),
//            child: Text(
//              'Your Result:',
//              style: TextStyle(color: Colors.white, fontSize: 20.0),
//            ),
//          ),
          Expanded(
            child: ReusableCard(
              colour: kReusableCardBackgroundColorActive,
              carChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "BMI - " + _calculatorBrain.getStatus(bmi),
                    style: TextStyle(color: Colors.green, fontSize: 20.0),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    bmi.toString(),
                    //style: TextStyle(color: Colors.white, fontSize: 60.0),
                    style: TextStyle(color: Colors.white, fontSize: 26.0),
                  ),
                  Text(
                    _calculatorBrain.getAdvice(bmi, gender, height),
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "MetLife weight ranges",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    _calculatorBrain.getRange(gender, height),
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onPressed: () {
              Navigator.pop(context);
            },
            labelText: 'Recalculate BMI',
          )
        ],
      ),
    );
  }
}
