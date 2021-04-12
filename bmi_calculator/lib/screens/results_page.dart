
import 'file:///D:/Apps/bmi_calculator/lib/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../components/Bottom_Container.dart';





class ResultsPage extends StatelessWidget {


  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultsPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                'Your Result',
                style: kBottomContainerTextStyle,
              ),
            ),
          ),
          Expanded(
              flex: 8,
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(resultText , style: kResultTextStyle),
                    Text(bmiResult, style: kBMITextStyle),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kDescriptionTextStyle,
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 1,
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: BottomContainer(
                  string: 'RE-CALCULATE',
                )),
          )
        ],
      ),
    );
  }
}

