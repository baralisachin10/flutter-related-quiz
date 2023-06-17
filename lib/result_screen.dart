import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/dummy_data/dummy_data.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
    required this.choosenAnswer,
    required this.onRestart,
  });

  final List<String> choosenAnswer;
  final void Function() onRestart;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<Map<String, Object>> get summaryOfData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < widget.choosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].questions,
          'correct_answer': questions[i].answers[0],
          'user_answer': widget.choosenAnswer[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryOfData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions questions out of $numTotalQuestions questions',
              style: GoogleFonts.lato(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryOfData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: widget.onRestart,
              icon: const Icon(Icons.restart_alt),
              label: Text(
                'Restart Quiz!!',
                style: GoogleFonts.lato(
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
