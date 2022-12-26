import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Models/quiz_model.dart';
import 'package:quizapp/Pages/Quiz/SplashCounter_page.dart';
import 'package:quizapp/utils/const.dart';

class QuizInfoPage extends StatefulWidget {
  QuizInfoPage({super.key, required this.quiz});
  QuizModel quiz;
  @override
  State<QuizInfoPage> createState() => _QuizInfoPageState();
}

class _QuizInfoPageState extends State<QuizInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        actions: null,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Image.asset(
            "assets/images/quizInfo/${quizImages[Random().nextInt(3)]}.png",
            scale: 1.5,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SPORTS",
                      style: GoogleFonts.rubik(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        widget.quiz.title,
                        style: GoogleFonts.rubik(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color(0xffefeefc),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  padding: const EdgeInsets.all(7),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: primaryColor,
                                  ),
                                  child: const Icon(
                                    Icons.question_mark,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                "${widget.quiz.listQuestions.length} Questions",
                                style: GoogleFonts.rubik(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffff8fa2),
                                  ),
                                  child: const Icon(
                                    Icons.control_point,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                "+${widget.quiz.points} points",
                                style: GoogleFonts.rubik(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DESCRIPTION",
                            style: GoogleFonts.rubik(
                              fontSize: 15,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              widget.quiz.description,
                              style: GoogleFonts.rubik(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Image.network(
                              widget.quiz.user.linkAvatar,
                              scale: 2,
                            ),
                            title: Text(
                              widget.quiz.user.username,
                              style: GoogleFonts.rubik(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              "Creator",
                              style: GoogleFonts.rubik(
                                fontSize: 12,
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  side: BorderSide(color: primaryColor),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SplashCountPage(quiz: widget.quiz),
                                    ));
                              },
                              child: Text(
                                "Play Solo",
                                style: GoogleFonts.rubik(
                                  fontSize: 15,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
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
                              onPressed: () {},
                              child: Text(
                                "Play with Friends",
                                style: GoogleFonts.rubik(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
