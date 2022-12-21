import 'package:mobx/mobx.dart';

part 'QuizPoints.store.g.dart';

class QuizPointStore = _QuizPointsStore with _$QuizPointStore;

abstract class _QuizPointsStore with Store {
  @observable
  int points = 0;

  @action
  void addPoint() {
    if (points < 300) {
      points++;
    }
  }

  @action
  void subtractPoint() {
    if (points > 0) {
      points--;
    }
  }
}
