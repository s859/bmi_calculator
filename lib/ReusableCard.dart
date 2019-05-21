import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget carChild;

  ReusableCard({@required this.colour, this.carChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: carChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colour, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
