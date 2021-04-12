import 'file:///D:/Apps/bmi_calculator/lib/components/icon_content.dart';
import 'file:///D:/Apps/bmi_calculator/lib/constants.dart';
import 'package:bmi_calculator/components/calculator_brain.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/Bottom_Container.dart';
import '../components/Round_icon_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  double height = 180;
  int weight = 70;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? kActiveCardColour
                          : kInActiveCardColour,
                      cardChild: iconCard(
                        iconName: FontAwesomeIcons.male,
                        text: 'MALE',
                      ),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                      child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInActiveCardColour,
                    cardChild: iconCard(
                      iconName: FontAwesomeIcons.female,
                      text: 'FEMALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  )),
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      SizedBox(
                        height: kSizedBoxSize,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.round().toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            ' cm',
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white54,
                            thumbColor: kBottomContainerColour,
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0)),
                        child: Slider(
                          value: height,
                          min: 120,
                          max: 220,
                          label: height.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              height = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              ' kg',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        SizedBox(
                          height: kSizedBoxSize,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (weight > 1) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: kSizedBoxSize,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  if (weight < 200) {
                                    weight++;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              ' yrs',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        SizedBox(
                          height: kSizedBoxSize,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: kSizedBoxSize,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  if (age < 200) {
                                    age++;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  CalculatorBrain calc = CalculatorBrain(
                    height: this.height.toInt(),
                    weight: this.weight,
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      ),
                    ),
                  );
                },
                child: BottomContainer( 
                  string: 'CALCULATE',
                ),
              ),
            )
          ],
        ));
  }
}
