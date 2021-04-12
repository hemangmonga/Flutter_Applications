import 'file:///D:/Apps/bmi_calculator/lib/constants.dart';
import 'package:flutter/material.dart';


class BottomContainer extends StatelessWidget {
  final String string;
  BottomContainer({@required this.string});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          string,
          style: kBottomContainerTextStyle,
        ),
      ),
      color: kBottomContainerColour,
      margin: EdgeInsets.only(top: 10.0),
      width: double.infinity,
      // height: 70.0,
    );
  }
}
