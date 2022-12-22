import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Models/quiz_model.dart';

class CardRecentQuiz extends StatelessWidget {
  const CardRecentQuiz({
    super.key,
    required this.listQuiz,
  });

  final List<QuizModel>? listQuiz;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xffffccd5),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: ListTile(
          title: Text(
            'RECENT QUIZ',
            style: GoogleFonts.rubik(
              color: const Color.fromARGB(255, 194, 134, 145),
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          subtitle: Row(
            children: [
              const Icon(
                Icons.earbuds,
                color: Color(0xff8d3948),
              ),
              Text(
                listQuiz!.isNotEmpty ? listQuiz![0].title : "QUIZ",
                style: GoogleFonts.rubik(
                  color: const Color(0xff8d3948),
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
