// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';

import 'package:quizapp/Models/question_model.dart';

class QuizModel {
  String title;
  String idCategory;
  String description;
  List<QuestionModel> listQuestions;
  String? iconImage;
  QuizModel({
    required this.title,
    required this.idCategory,
    required this.description,
    required this.listQuestions,
    this.iconImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'idCategory': idCategory,
      'description': description,
      'listQuestions': listQuestions.map((x) => x.toMap()).toList(),
      'iconImage': iconImage,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'] as String,
      idCategory: map['idCategory'] as String,
      description: map['description'] as String,
      listQuestions: List<QuestionModel>.from(
        (map['listQuestions'] as List<QuestionModel>).map<QuestionModel>(
          (x) => QuestionModel.fromMap(x.toMap()),
        ),
      ),
      iconImage: map['iconImage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
