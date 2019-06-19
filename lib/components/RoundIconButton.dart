import 'package:flutter/material.dart';

typedef GestureTapCallback = void Function();

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final GestureTapCallback onPress;
  final double iconSize;
  final double boxSize;

  RoundIconButton({this.icon, this.onPress, this.iconSize, this.boxSize});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, size: iconSize),
      elevation: 6,
      onPressed: () {
        onPress();
      },
      constraints: BoxConstraints.tightFor(
        width: boxSize,
        height: boxSize,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
