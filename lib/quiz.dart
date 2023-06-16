import 'package:flutter/material.dart';
import 'package:quiz_app/dummy_data/dummy_data.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  // function to switch screen
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void onRestart() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget startScreen = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      startScreen = QuestionScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'result-screen') {
      startScreen = ResultScreen(
        choosenAnswer: selectedAnswer,
        onRestart: onRestart,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: activeScreen == 'start-screen'
          //     ? StartScreen(switchScreen)
          //     : const QuestionScreen(),
          child: startScreen,
        ),
      ),
    );
  }
}
