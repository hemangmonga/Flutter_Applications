import 'package:flutter/material.dart';

// ignore: camel_case_types
class RoundedButton extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final Color Colour;
  final String buttonText;
  final Function onPress;
  // ignore: non_constant_identifier_names
  RoundedButton({@required this.Colour, @required this.buttonText, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: Colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
            onPressed: onPress,
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              buttonText,
              style: TextStyle(
                color: Colors.white,
              ),
            )
        ),
      ),
    );
  }
}
