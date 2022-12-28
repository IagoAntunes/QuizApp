// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quizapp/Models/quiz_model.dart';
import 'package:quizapp/Models/userT_model.dart';

class Play {
  QuizModel quiz;
  User user;
  String points;

  Play({
    required this.points,
    required this.user,
    required this.quiz,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quiz': quiz.toMap(1),
      'user': user.toMap(),
      'points': points,
    };
  }

  factory Play.fromMap(Map<String, dynamic> map) {
    return Play(
      quiz: QuizModel.fromMap(map['quiz'] as Map<String, dynamic>),
      user: User.fromMap(map['user'] as Map<String, dynamic>),
      points: map['points'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Play.fromJson(String source) =>
      Play.fromMap(json.decode(source) as Map<String, dynamic>);
}
