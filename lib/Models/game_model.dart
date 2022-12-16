// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quizapp/Models/quiz_model.dart';

class GameModel {
  QuizModel quiz;
  int points;
  List<int> listCorrect;
  GameModel({
    required this.quiz,
    required this.points,
    required this.listCorrect,
  });
}
