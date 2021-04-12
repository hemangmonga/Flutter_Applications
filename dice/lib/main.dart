import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red[400],
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dicee'),
          leading: IconButton(
            // alignment: Alignment.topRight,
            icon: const Icon(Icons.help_outline),
            tooltip: 'Press anywhere on screen to roll dice',
            onPressed: (){},
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (){
       setState(() {
         leftDiceNumber = generateRandomNumber()+1;
         rightDiceNumber = generateRandomNumber()+1;
       });
      },
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('images/dice$rightDiceNumber.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



int generateRandomNumber(){
  var random = new Random();
  return random.nextInt(6);
}