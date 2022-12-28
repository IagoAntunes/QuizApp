import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Models/play_model.dart';
import 'package:quizapp/Pages/Quiz/ReviewAnswers_page.dart';
import 'package:quizapp/Pages/navpage.dart';
import 'package:quizapp/Providers/userParse_provider.dart';
import 'package:quizapp/Providers/user_provider.dart';
import 'package:quizapp/Services/plays_service.dart';

import '../../Models/game_model.dart';
import '../../Models/quiz_model.dart';
import '../../Models/userT_model.dart';
import '../../utils/const.dart';

class InfoEndGamePage extends StatefulWidget {
  const InfoEndGamePage({
    super.key,
    required this.quiz,
    required this.game,
  });
  final QuizModel quiz;
  final GameModel game;
  @override
  State<InfoEndGamePage> createState() => _InfoEndGamePageState();
}

class _InfoEndGamePageState extends State<InfoEndGamePage> {
  @override
  Widget build(BuildContext context) {
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
        title: const Text('Good Job!'),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: Color(0xffff8fa2),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    "assets/images/trofeu.png",
                    scale: 1.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'You get +${widget.quiz.points} Quiz Points',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.rubik(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReviewAnswersPage(
                                      quiz: widget.quiz, game: widget.game),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffffb1be),
                                shadowColor: Colors.transparent,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                )),
                            child: Text(
                              'Check corret Answer',
                              style: GoogleFonts.rubik(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CORRECT ANSWER',
                              style: GoogleFonts.rubik(
                                fontSize: 14,
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${widget.quiz.listQuestions.length} Questions',
                              style: GoogleFonts.rubik(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'COMPLETION',
                              style: GoogleFonts.rubik(
                                fontSize: 14,
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${((widget.game.listCorrect.where((element) => element == 1).length * 100) / widget.quiz.listQuestions.length).round()}%',
                              style: GoogleFonts.rubik(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'INCORRECT ANSWER',
                              style: GoogleFonts.rubik(
                                fontSize: 14,
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${widget.game.listCorrect.where((element) => element == 0).length}',
                              style: GoogleFonts.rubik(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SKIPPED',
                              style: GoogleFonts.rubik(
                                fontSize: 14,
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${widget.game.listCorrect.where((element) => element == 2).length}',
                              style: GoogleFonts.rubik(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
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
                        onPressed: () async {
                          String points = '0';
                          UserParseProvider parseProv =
                              context.read<UserParseProvider>();
                          ParseUser parseUser = parseProv.userParse!;
                          UserProvider userProv = context.read<UserProvider>();
                          User? user = userProv.user;
                          if (widget.game.listCorrect
                                  .where((element) => element == 1)
                                  .length >=
                              (widget.game.listCorrect.length / 2).round()) {
                            points = widget.quiz.points;
                            parseUser.set(
                              'points',
                              user!.points + int.parse(widget.quiz.points),
                            );
                            parseUser.update();
                          }
                          Play play = Play(
                              user: user!, quiz: widget.quiz, points: points);
                          await PlaysService().postPlay(play.toJson());
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NavPage(),
                            ),
                          );
                        },
                        child: const Text("Done"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                    height: 50,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          width: 2,
                          color: Colors.grey.shade300,
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Icon(
                        Icons.share_outlined,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
