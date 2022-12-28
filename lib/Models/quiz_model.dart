// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quizapp/Models/question_model.dart';
import 'package:quizapp/Models/userT_model.dart';

import 'category_model.dart';

class QuizModel {
  String? objectId;
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
    required this.points,
    required this.listQuestions,
    this.objectId,
    this.iconImage,
    required this.category,
    required this.user,
  });

  Map<String, dynamic> toMap(int opc) {
    if (opc == 1) {
      return <String, dynamic>{
        '__type': "Pointer",
        'className': "Quiz",
        'objectId': objectId,
      };
    }
    return <String, dynamic>{
      'objectid': objectId,
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
      objectId: map['objectId'] ?? '',
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

  String toJson() => json.encode(toMap(0));

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
