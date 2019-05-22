import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/ReusableCard.dart';
import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              'Your Result',
              style: TextStyle(color: Colors.white, fontSize: 40.0),
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: reusableCardBackgroundColorInactive,
              carChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Overweight",
                    style: TextStyle(color: Colors.green, fontSize: 20.0),
                  ),
                  Text(
                    '26',
                    style: TextStyle(color: Colors.white, fontSize: 60.0),
                  ),
                  Text(
                    'You have larger than average weight.',
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            onPressed: () {
              Navigator.pop(context);
            },
            labelText: 'RE-CALCULATE',
          )
        ],
      ),
    );
  }
}
