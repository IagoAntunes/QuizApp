// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quizapp/Models/question_model.dart';
import 'package:quizapp/Models/userT_model.dart';

import 'category_model.dart';

class QuizModel {
  String title;
  String description;
  String points;
  List<QuestionModel> listQuestions;
  String? iconImage;
  CategoryModel category;
  User user;
  QuizModel({
    required this.title,
    required this.description,
    required this.listQuestions,
    required this.points,
    required this.category,
    required this.user,
    this.iconImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'listQuestions': listQuestions.map((x) => x.toMap()).toList(),
      'iconImage': iconImage,
      'category': category.toMap(),
      'userCreator': user.toMap(),
      'points': points,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'] as String,
      description: map['description'] as String,
      listQuestions: List<QuestionModel>.from(
          (map['listQuestions'] as List<QuestionModel>)),
      iconImage: map['iconImage'] != null ? map['iconImage'] as String : null,
      category: map['category'],
      user: map['userCreator'],
      points: map['points'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
