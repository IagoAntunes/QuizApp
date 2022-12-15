import 'dart:convert';

import 'package:quizapp/Models/answer_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuestionModel {
  String question;
  bool answer;
  List<AnswerModel> listAnswer;
  QuestionModel({
    required this.question,
    required this.answer,
    required this.listAnswer,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'answer': answer,
      'listAnswer': listAnswer.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      question: map['question'] as String,
      answer: map['answer'] as bool,
      listAnswer: List<AnswerModel>.from(
        (map['listAnswer'] as List<dynamic>).map<AnswerModel>(
          (x) => AnswerModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
