import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constants.dart';

typedef GestureCallBack = void Function();

class BottomButton extends StatelessWidget {
  final GestureCallBack onPressed;
  final String labelText;

  BottomButton({this.onPressed, this.labelText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        child: Center(
          child: Text(
            labelText,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: bottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 10.0),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}
