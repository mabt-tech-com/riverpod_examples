import 'package:flutter/material.dart';
import 'answers.dart';
import 'questions.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCQ-Based Quiz App',
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _questionIndex = 0;
  //Declaring variables to store previous answers
  String prevAns = "", prevCorrectAns = "";

  //Boolean variable to check of this was the user's
  //first attempt at the question.
  bool firstAttempt = true;
  //Boolean variable to check if the user's answer was correct.
  bool check = true;

  //Defining the function for tapping on a any specific answer.
  void _answerQuestion(String myAns) {
    //Made to false as the user made the first attempt on tapping
    //an answer and calling this function.
    firstAttempt = false;
    setState(() {
      // The following boolean statement checks if answer was true.
      if (myAns == _questions[_questionIndex]['correctAns'].toString()) {
        //check as true means that the answer was correct.
        check = true;
      } else {
        //check as false means that the answer was correct.
        check = false;
      }
      prevAns = myAns;
      prevCorrectAns = _questions[_questionIndex]['correctAns'].toString();
      if (_questionIndex == 2) {
        //If the index of the last question is displayed here then it is set back
        //to 0 (the index of the first question), essentially resetting the quiz.
        _questionIndex = 0;
      } else {
        _questionIndex = _questionIndex + 1;
      }
    });
  }

  var _questions = [
    //A list of dictionaries which represent the question, possible answers
    //and the correct answer.
    {
      'questionText': 'What\'s the meaning of assuetude?',
      'answers': ['kiss', 'insolent', 'habit', 'half'],
      'correctAns': 'habit',
    },
    {
      'questionText': 'What\'s the meaning of disingenuous?',
      'answers': ['guilty', 'jovial', 'jocular', 'insincere'],
      'correctAns': 'insincere',
    },
    {
      'questionText': 'What\'s the meaning of afflatus?',
      'answers': ['ghost', 'inspiration', 'lifeless', 'greedy'],
      'correctAns': 'inspiration',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MCQ-Based Quiz App'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(
          20.0,
        ),
        margin: EdgeInsets.all(
          10.0,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Questions(
                  //This displays the current question tracked by
                  //the _questionIndex variable.
                  _questions[_questionIndex]['questionText'].toString(),
                ),
                //This displays the current questionanswers set tracked by
                //the _questionIndex variable. The spread operator helps in
                //extracting all answers without the need to write this
                //code 4 times.
                ...(_questions[_questionIndex]['answers'] as List<String>).map((answer) {
                  return Answers(answer, _answerQuestion);
                }).toList(),
                SizedBox(
                  height: 10.0,
                ),
                //If this was the user's first attempt then any
                //empty container is displayed.
                (firstAttempt)
                    ? Container()
                    : (check) //If the check variable is true that a
                        //correct answer message is displayed, otherwise
                        //an incorrect answer message is displayed.
                        ? Column(
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 50.0,
                                semanticLabel: 'Correct Answer',
                              ),
                              Text("Your answer $prevAns was correct."),
                            ],
                          )
                        : Column(
                            children: [
                              Icon(
                                Icons.clear,
                                color: Colors.red,
                                size: 50.0,
                                semanticLabel: 'Wrong Answer',
                              ),
                              Text(
                                "Your answer $prevAns was wrong.\nThe correct answer was $prevCorrectAns.",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
