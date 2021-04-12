import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ask Me Anything'),
        backgroundColor: Colors.blue[900],
      ),
      body: Magic8Ball(),
    ),
  ));
}

class Magic8Ball extends StatefulWidget {
  @override
  _Magic8BallState createState() => _Magic8BallState();
}

class _Magic8BallState extends State<Magic8Ball> {
  var height = AppBar().preferredSize.height;
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset('images/ball$number.png'),
        ),
        FlatButton(
          onPressed: (){
            setState(() {
              number = generateRandomNumber()+1;
            });
          },
          child: Container(
            margin: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: Text('Get Answer!',
              style: TextStyle(fontSize: height/1.5),
            ),
            color: Colors.white,
            width: double.infinity,
          ),
        )
      ],
    );
  }
}


int generateRandomNumber(){
  var random = new Random();
  return random.nextInt(5);
}