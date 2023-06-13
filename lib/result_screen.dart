import 'package:flutter/material.dart';
import 'package:quiz_app/dummy_data/dummy_data.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.choosenAnswer,
  });

  final List<String> choosenAnswer;

  List<Map<String, Object>> getSummarData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].questions,
          'correct_answer': questions[i].answers[0],
          'user_answer': choosenAnswer
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You answered X questions out of Y questions'),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(getSummarData()),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.restart_alt),
              label: const Text('Restart Quiz!!'),
            )
          ],
        ),
      ),
    );
  }
}
