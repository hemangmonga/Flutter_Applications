import 'file:///D:/Apps/bmi_calculator/lib/constants.dart';
import 'package:flutter/material.dart';
// ignore: camel_case_types
class iconCard extends StatelessWidget {
  final IconData iconName;
  final String text;

  iconCard({@required this.iconName, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconName,
          size: kIconSize,
        ),
        SizedBox(
          height: kSizedBoxSize,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: kTextFontSize,
            color: kCardTextColour,
          ),
        )
      ],
    );
  }
}
