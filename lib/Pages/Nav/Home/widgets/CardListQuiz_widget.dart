import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Models/quiz_model.dart';
import '../../../../utils/const.dart';
import '../../../Quiz/QuizInfo_page.dart';
import '../ListQuiz_page.dart';

class CardListQuiz extends StatelessWidget {
  const CardListQuiz({
    super.key,
    required this.size,
    required this.listQuiz,
  });

  final Size size;
  final List<QuizModel>? listQuiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.30,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Live Quizzes',
                  style: GoogleFonts.rubik(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListQuizPage(),
                        ));
                  },
                  child: Text(
                    "See all",
                    style: GoogleFonts.rubik(
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.20,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            QuizInfoPage(quiz: listQuiz![index]),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 206, 200, 200),
                            width: 1.5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xffC4D0FB),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: index == 0
                                  ? const EdgeInsets.only(left: 10, top: 10)
                                  : const EdgeInsets.only(
                                      left: 5, top: 5, bottom: 5, right: 5),
                              child: listQuiz![index].iconImage == null
                                  ? const Icon(Icons.people)
                                  : Image.memory(base64Decode(
                                      listQuiz![index].iconImage!)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listQuiz![index].title,
                                  style: GoogleFonts.rubik(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "${listQuiz![index].description} º ${listQuiz![index].listQuestions.length}",
                                  style: GoogleFonts.rubik(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_right_rounded,
                              size: 40,
                              color: primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: 2,
            ),
          )
        ],
      ),
    );
  }
}
