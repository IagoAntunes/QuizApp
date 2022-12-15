import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Models/quiz_model.dart';
import 'package:quizapp/utils/const.dart';

class QuizGamePage extends StatefulWidget {
  QuizGamePage({super.key, required this.quiz});
  QuizModel quiz;
  @override
  State<QuizGamePage> createState() => _QuizGamePageState();
}

class _QuizGamePageState extends State<QuizGamePage> {
  int indexQuestion = 0;
  int? selectedAnswer;
  bool? correct;
  int sendAnswer = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: SizedBox(
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Sla'),
                  Text(
                    "QUESTION ${indexQuestion} OF ${widget.quiz.listQuestions.length}",
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.quiz.listQuestions[indexQuestion].question,
                    style: GoogleFonts.rubik(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      itemCount: widget
                          .quiz.listQuestions[indexQuestion].listAnswer.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                selectedAnswer = index;
                              },
                            );
                          },
                          onDoubleTap: () {
                            if (widget.quiz.listQuestions[indexQuestion]
                                .listAnswer[index].correctAnswer) {
                              setState(
                                () {
                                  sendAnswer = 1;
                                  correct = true;
                                },
                              );
                            } else {
                              setState(
                                () {
                                  sendAnswer = 1;
                                  correct = false;
                                },
                              );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 1.5),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: sendAnswer == 0
                                  ? (selectedAnswer == index
                                      ? Colors.grey
                                      : Colors.transparent)
                                  : widget.quiz.listQuestions[indexQuestion]
                                          .listAnswer[index].correctAnswer
                                      ? Colors.green
                                      : Colors.white,
                            ),
                            child: Text(
                              widget.quiz.listQuestions[indexQuestion]
                                  .listAnswer[index].answerT,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
