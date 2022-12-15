// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class AnswerModel {
  bool correctAnswer;
  TextEditingController controller = TextEditingController();
  String answerT = "";
  AnswerModel({
    this.correctAnswer = false,
    this.answerT = "",
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'correctAnswer': correctAnswer,
      'answerT': answerT,
    };
  }

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return AnswerModel(
      correctAnswer: map['correctAnswer'] as bool,
      answerT: map['answerT'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswerModel.fromJson(String source) =>
      AnswerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
