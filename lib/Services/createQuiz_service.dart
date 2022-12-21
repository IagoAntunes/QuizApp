import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:quizapp/Models/quiz_model.dart';
import 'package:quizapp/Models/user_model.dart';
import 'package:quizapp/utils/const.dart';

import '../Models/category_model.dart';
import '../Models/question_model.dart';

class CreateQuizService {
  Future<String> postQuiz(String quiz) async {
    try {
      final response =
          await http.post(Uri.parse(uriApi + "/parse/classes/Quiz"),
              headers: <String, String>{
                'X-Parse-Application-Id':
                    'rEe5OVkoHsWOc3igs1ofd7vvy0EqKhdStryjaKWJ',
                'X-Parse-REST-API-Key':
                    '4Oeb8idoFeBZQ67vkS4Wi4xYsIdPcJA7uUtE55zE',
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: quiz);
      var res = jsonDecode(response.body);
      return 'teste';
    } catch (e) {
      return 'Falha ao Enviar';
    }
  }

  Future<List<QuizModel>> getListQuiz() async {
    List<QuizModel> list = [];
    try {
      final response = await http.get(
        Uri.parse(uriApi + "/parse/classes/Quiz?include=category"),
        headers: <String, String>{
          'X-Parse-Application-Id': 'rEe5OVkoHsWOc3igs1ofd7vvy0EqKhdStryjaKWJ',
          'X-Parse-REST-API-Key': '4Oeb8idoFeBZQ67vkS4Wi4xYsIdPcJA7uUtE55zE'
        },
      );
      var res = jsonDecode(response.body);
      Map<String, dynamic> data = jsonDecode(response.body);
      for (var quiz in res['results']) {
        Map<String, dynamic> map = {
          "title": quiz['title'] as String,
          "description": quiz['description'] as String,
          "listQuestions": List<QuestionModel>.from(
            (quiz['listQuestions'] as List<dynamic>).map<QuestionModel>(
              (x) => QuestionModel.fromMap(x as Map<String, dynamic>),
            ),
          ),
          "iconImage": quiz['iconImage'],
          "category": CategoryModel.fromMap(
            quiz['category'],
          )
        };
        list.add(QuizModel.fromMap(map));
      }

      return list;
    } catch (e) {
      return [];
    }
  }
}
