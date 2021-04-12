import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: quizPage(),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class quizPage extends StatefulWidget {
  @override
  _quizPageState createState() => _quizPageState();
}

class _quizPageState extends State<quizPage> {
  List<Widget> scoreKeeper = [];

  bool isNextQuestion;


  void correctAnswer() {
    scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        )
    );
  }

  void wrongAnswer() {
    scoreKeeper.add(
        Icon(
          Icons.close,
          color: Colors.red,
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                if (quizBrain.getQuestionAnswer() == true) {
                  correctAnswer();
                } else {
                  wrongAnswer();
                }
                setState(() {
                  isNextQuestion = quizBrain.nextQuestion();
                  if (isNextQuestion == false){
                    scoreKeeper = [];
                    Alert(context: context, title: "Quiz Ended", desc: "Restarting the Quiz").show();
                  }
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                'TRUE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () {
                  if (quizBrain.getQuestionAnswer() == false) {
                    correctAnswer();
                  } else {
                    wrongAnswer();
                  }
                  setState(() {
                    isNextQuestion = quizBrain.nextQuestion();
                    if (isNextQuestion == false){
                      scoreKeeper = [];
                      Alert(context: context, title: "Quiz Ended", desc: "Restarting the Quiz").show();
                    }
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text(
                  'FALSE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                )
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )

      ],
    );
  }
}
