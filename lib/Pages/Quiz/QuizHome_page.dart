import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Models/quiz_model.dart';
import 'package:quizapp/Pages/Nav/Create/CreateQuestions_page.dart';
import 'package:quizapp/Pages/navpage.dart';
import 'package:quizapp/utils/const.dart';

import '../../Services/createQuiz_service.dart';

class QuizHomePage extends StatefulWidget {
  QuizHomePage({super.key, required this.quiz});
  QuizModel quiz;
  @override
  State<QuizHomePage> createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        actions: null,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text("Quiz"),
        titleTextStyle:
            GoogleFonts.rubik(fontSize: 24, fontWeight: FontWeight.w500),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          color: Color(0xfff0eefb),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.military_tech,
                              color: primaryColor,
                              size: 20,
                            ),
                            Text(
                              widget.quiz.idCategory.toString(),
                              style: GoogleFonts.rubik(
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Text(
                    widget.quiz.title,
                    style: GoogleFonts.rubik(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.quiz.description,
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'Questions',
                              style: GoogleFonts.rubik(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              color: primaryColor,
                            ),
                            child: Text(
                              widget.quiz.listQuestions.length.toString(),
                              style: GoogleFonts.rubik(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateQuestionsPage(
                                quiz: widget.quiz,
                              ),
                            ),
                          ).then((value) {
                            if (value != null) {
                              setState(() {
                                widget.quiz = value;
                              });
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: size.height * 0.4,
                    decoration: BoxDecoration(
                      color: Color(0xffefeefc),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: widget.quiz.listQuestions.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.quiz.listQuestions[index].question,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.rubik(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'Multiple Choices',
                                      style: GoogleFonts.rubik(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: SizedBox(
                      width: size.width,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () {
                          CreateQuizService().postQuiz(widget.quiz.toJson());
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NavPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Save",
                          style: GoogleFonts.rubik(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
