import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final String yourAnswer; //Answer text
  //Function that is call upon when this
  //specific answer object is tapped upon.
  final Function answerQuestion;
  Answers(this.yourAnswer, this.answerQuestion);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      //Answer will be displayed as a button rather than
      //simple text, to allow for interactivity.
      child: ElevatedButton(
        child: Text(
          yourAnswer, //Answer text
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
        style: ButtonStyle(
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        ),
        // color: Colors.blue, //Adjust button color here, default is set to blue.

        //function call to check this answer and proceed
        //to the next question.
        onPressed: () => answerQuestion(yourAnswer),
      ),
    );
  }
}
