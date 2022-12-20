import 'dart:async';

import 'package:mobx/mobx.dart';

part 'QuizGame.store.g.dart';

class QuizGameStore = _QuizGameStore with _$QuizGameStore;

abstract class _QuizGameStore with Store {
  Timer? timer;
  @observable
  int seconds = 10;

  @observable
  int? selectedIndex;

  @action
  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (seconds == 0) {
          timer!.cancel();
        } else {
          seconds--;
        }
      },
    );
  }

  void endRound() {}
}
