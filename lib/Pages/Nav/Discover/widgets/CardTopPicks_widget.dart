import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Models/quiz_model.dart';

class CardTopPicks extends StatelessWidget {
  const CardTopPicks({
    super.key,
    required this.size,
    required this.listQuiz,
  });

  final Size size;
  final List<QuizModel> listQuiz;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Container(
        height: 150,
        width: size.width,
        decoration: const BoxDecoration(
          color: Color(0xffffccd5),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Color(0xffff8fa2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    "TOP PICKS",
                    style: GoogleFonts.rubik(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 1,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listQuiz[0].title,
                      style: GoogleFonts.rubik(
                        color: const Color(0xff8d3949),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          size: 15,
                          color: Color(0xff8d3949),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${listQuiz[0].category.name} - ${listQuiz[0].listQuestions.length.toString()}',
                          style: GoogleFonts.rubik(
                            color: const Color(0xff8d3949),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
