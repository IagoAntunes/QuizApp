import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:quizapp/Models/quiz_model.dart';

import '../Pages/Quiz/QuizGame_page.dart';

part 'QuizCounter.store.g.dart';

class SplashCounterState = _SplashCounterState with _$SplashCounterState;

abstract class _SplashCounterState with Store {
  Timer? cronometro;

  @observable
  int segundos = 5;

  @action
  void iniciar(BuildContext context, QuizModel quiz) {
    cronometro = Timer.periodic(Duration(seconds: 1), (timer) {
      segundos--;
      if (segundos == 0) {
        cronometro!.cancel();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizGamePage(quiz: quiz),
          ),
        );
      }
    });
  }
}
