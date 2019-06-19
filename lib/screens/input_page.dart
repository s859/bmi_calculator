import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/ReusableCard.dart';
import 'package:bmi_calculator/components/ReusableImageTextCard.dart';
import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/components/RoundIconButton.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/CalculatorBrain.dart';

const bottomContainerHeight = 70.0;
const reusableCardBackgroundColorActive = Color(0xFF1D1E33);
const reusableCardBackgroundColorInactive = Color(0xFF111328);
const bottomContainerColour = Color(0xffeb1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String gender = "F";
  int height = 67; // 5' 7"
  int weight = 140;
  int age = 35;
  int displayFeet = 5;
  int displayInches = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: gender == 'M'
                        ? reusableCardBackgroundColorActive
                        : reusableCardBackgroundColorInactive,
                    carChild: ReusableImageTextCard(
                      iconData: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                    onPress: () {
                      setState(() {
                        gender = 'M';
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: gender == 'F'
                        ? reusableCardBackgroundColorActive
                        : reusableCardBackgroundColorInactive,
                    carChild: ReusableImageTextCard(
                      iconData: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                    onPress: () {
                      setState(() {
                        gender = 'F';
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: reusableCardBackgroundColorActive,
              carChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
//                      Text(
//                        height.toString(),
//                        style: kNumberTextStyle,
//                      ),
//                      Text(
//                        'inches',
//                        style: kLabelTextStyle,
//                      ),
                      Text(
                        displayFeet.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        " feet ",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        displayInches.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        ' inches',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xff8d8e98),
                        thumbColor: Color(0xffeb1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayColor: Color(0x29eb1555),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 28.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 50.0,
                      max: 88.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                          displayFeet = height ~/ 12;
                          displayInches = height % 12;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: reusableCardBackgroundColorActive,
                    carChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              iconSize: 38.0,
                              boxSize: 60.0,
                              onPress: () {
                                setState(() {
                                  weight = weight - 5;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              iconSize: 24.0,
                              boxSize: 36.0,
                              onPress: () {
                                setState(() {
                                  weight = weight - 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              iconSize: 24.0,
                              boxSize: 36.0,
                              onPress: () {
                                setState(() {
                                  weight = weight + 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              iconSize: 38.0,
                              boxSize: 60.0,
                              onPress: () {
                                setState(() {
                                  weight = weight + 5;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onPressed: () {
              int bmi = CalculatorBrain(height: height, weight: weight)
                  .bmiCalculate();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage(
                      bmi: bmi,
                      gender: gender,
                      height: height,
                    );
                  },
                ),
              );
            },
            labelText: 'Calculate',
          )
        ],
      ),
    );
  }
}
