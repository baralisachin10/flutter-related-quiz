import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'The questions',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 50,
          ),
          AnswerButton('Answer 1', () {}),
          AnswerButton('Answer 2', () {}),
          AnswerButton('Answer 3', () {}),
        ],
      ),
    );
  }
}
