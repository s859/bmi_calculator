import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constants.dart';

class ReusableImageTextCard extends StatelessWidget {
  final IconData iconData;
  final String text;

  ReusableImageTextCard({@required this.iconData, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 80.0,
        ),
        SizedBox(
          width: double.infinity,
          height: 15.0,
        ),
        Text(
          text,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
