import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Pages/Nav/Home/widgets/CardFindFriends_widget.dart';
import 'package:quizapp/Pages/Nav/Home/widgets/CardListQuiz_widget.dart';
import 'package:quizapp/Pages/Nav/Home/widgets/CardRecentQuiz_widget.dart';
import 'package:quizapp/Pages/Nav/Home/widgets/Head_widget.dart';
import 'package:quizapp/Providers/listQuiz_provider.dart';
import 'package:quizapp/Providers/user_provider.dart';

import '../../../Models/User_model.dart';
import '../../../Models/quiz_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user;
  List<QuizModel>? listQuiz;
  @override
  void initState() {
    ListQuizProvider prov2 = context.read<ListQuizProvider>();
    listQuiz = prov2.listQuiz;
    super.initState();
    UserProvider prov = context.read<UserProvider>();
    user = prov.user;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Head(user: user),
              CardRecentQuiz(listQuiz: listQuiz),
              const SizedBox(height: 20),
              const CardFindFriends(),
            ],
          ),
          const SizedBox(height: 30),
          CardListQuiz(size: size, listQuiz: listQuiz)
        ],
      ),
    );
  }
}
