import 'package:flutter/material.dart';
import 'package:quizapp/Models/quiz_model.dart';

class ListQuizProvider extends ChangeNotifier {
  List<QuizModel> listQuiz = [];

  setListQuiz(List<QuizModel> listQuizP) {
    listQuiz = listQuizP;
  }

  List<QuizModel> getListQuiz() {
    return listQuiz;
  }
}
