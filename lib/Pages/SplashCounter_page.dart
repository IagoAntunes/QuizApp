import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quizapp/Models/quiz_model.dart';
import 'package:quizapp/Pages/QuizGame_page.dart';
import 'package:quizapp/utils/const.dart';

class SplashCountPage extends StatefulWidget {
  SplashCountPage({super.key, required this.quiz});
  QuizModel quiz;
  @override
  State<SplashCountPage> createState() => _SplashCountPageState();
}

class _SplashCountPageState extends State<SplashCountPage> {
  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: 5);

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 6
  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(
      () {
        final seconds = myDuration.inSeconds - reduceSecondsBy;
        if (seconds < 0) {
          countdownTimer!.cancel();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizGamePage(quiz: widget.quiz),
            ),
          );
        } else {
          myDuration = Duration(seconds: seconds);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(1, '0');
    // Step 7
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(60),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 5,
              color: Colors.yellow,
            ),
          ),
          child: Text(
            '$seconds',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 80,
            ),
          ),
        ),
      ),
    );
  }
}
