import 'package:flutter/material.dart';

typedef GestureTapCallback = void Function();

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget carChild;
  final GestureTapCallback onPress;

  ReusableCard({@required this.colour, this.carChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        child: carChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
