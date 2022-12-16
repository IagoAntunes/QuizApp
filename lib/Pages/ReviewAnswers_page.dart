import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Models/answer_model.dart';
import 'package:quizapp/utils/const.dart';

import '../Models/game_model.dart';
import '../Models/quiz_model.dart';

class ReviewAnswersPage extends StatefulWidget {
  ReviewAnswersPage({
    super.key,
    required this.quiz,
    required this.game,
  });
  QuizModel quiz;
  GameModel game;
  @override
  State<ReviewAnswersPage> createState() => _ReviewAnswersPageState();
}

class _ReviewAnswersPageState extends State<ReviewAnswersPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.close,
              size: 35,
              color: Colors.black,
            ),
          )
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text('Review Answers'),
        titleTextStyle: GoogleFonts.rubik(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/background2.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'QUIZ NAME',
                          style: GoogleFonts.rubik(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'English Premier LEague',
                            style: GoogleFonts.rubik(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Color(0xffff8fa2),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: RichText(
                                          text: TextSpan(
                                            text: widget.game.listCorrect
                                                .where((element) =>
                                                    element == 0 ||
                                                    element == 1)
                                                .length
                                                .toString(),
                                            style: GoogleFonts.rubik(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    "/${widget.quiz.listQuestions.length.toString()}",
                                                style: GoogleFonts.rubik(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      bottom: 1,
                                      right: 10,
                                      top: 25,
                                      left: 1,
                                    ),
                                    const SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: CircularProgressIndicator(
                                        value: 0.5,
                                        color: Colors.white,
                                        backgroundColor: Color(0xffffa5b5),
                                        strokeWidth: 9,
                                      ),
                                    ),
                                  ],
                                ),
                                Flexible(
                                  child: Text(
                                    'You Answered ${widget.game.listCorrect.where((element) => element == 0 || element == 1).length} out of ${widget.quiz.listQuestions.length} questions',
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.rubik(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 20),
                      child: Text(
                        'Your Answers',
                        style: GoogleFonts.rubik(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * 0.4,
                      decoration: const BoxDecoration(
                        color: Color(0xffefeefc),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: widget.quiz.listQuestions.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    index.toString(),
                                    style: GoogleFonts.rubik(
                                      color: primaryColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget
                                            .quiz.listQuestions[index].question,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.rubik(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        widget.quiz.listQuestions[index]
                                            .listAnswer
                                            .where((element) =>
                                                element.correctAnswer == true)
                                            .first
                                            .answerT,
                                        style: GoogleFonts.rubik(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                widget.game.listCorrect[index] == 1
                                    ? Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      )
                                    : Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
