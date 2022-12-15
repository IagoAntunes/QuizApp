import 'dart:convert';

import 'package:quizapp/Models/quiz_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static Future<Database> db() async {
    return openDatabase(
      'quizApp.db',
      version: 1,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<void> createTables(Database database) async {
    await database.execute("""CREATE TABLE quiz(
        quiz TEXT)
      """);
  }

  static Future<void> insertQuiz(String quiz) async {
    final db = await LocalDatabase.db();
    await db.insert('quiz', {'quiz': quiz});
  }

  static Future<List<QuizModel>> getQuiz() async {
    final db = await LocalDatabase.db();
    List<Map<String, dynamic>> dataQuiz = await db.query('quiz');
    List<QuizModel> listaQuiz = [];
    for (var quiz in dataQuiz) {
      listaQuiz.add(QuizModel.fromJson(quiz['quiz']));
    }
    return listaQuiz;
  }

  static deleteQuiz() async {
    Database db = await LocalDatabase.db();
    return await db.rawDelete("DELETE FROM quiz");
  }
}
