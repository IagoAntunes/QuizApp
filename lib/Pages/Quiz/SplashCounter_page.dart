import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:quizapp/Models/quiz_model.dart';
import 'package:quizapp/store/QuizCounter.store.dart';
import 'package:quizapp/utils/const.dart';

class SplashCountPage extends StatefulWidget {
  const SplashCountPage({super.key, required this.quiz});
  final QuizModel quiz;
  @override
  State<SplashCountPage> createState() => _SplashCountPageState();
}

class _SplashCountPageState extends State<SplashCountPage> {
  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: 5);
  final store = SplashCounterState();
  @override
  void initState() {
    store.iniciar(context, widget.quiz);

    super.initState();
  }

  // void startTimer() {
  //   countdownTimer =
  //       Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  // }

  // void setCountDown() {
  //   const reduceSecondsBy = 1;
  //   setState(
  //     () {
  //       final seconds = myDuration.inSeconds - reduceSecondsBy;
  //       if (seconds < 0) {
  //         countdownTimer!.cancel();
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => QuizGamePage(quiz: widget.quiz),
  //           ),
  //         );
  //       } else {
  //         myDuration = Duration(seconds: seconds);
  //       }
  //     },
  //   );
  // }

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
          child: Observer(
            builder: (context) => Text(
              '${store.segundos}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 80,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
