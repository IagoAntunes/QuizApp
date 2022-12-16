import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Models/game_model.dart';
import 'package:quizapp/Models/quiz_model.dart';
import 'package:quizapp/Pages/InfoEndGame_page.dart';
import 'package:quizapp/utils/const.dart';

class QuizGamePage extends StatefulWidget {
  const QuizGamePage({super.key, required this.quiz});
  final QuizModel quiz;
  @override
  State<QuizGamePage> createState() => _QuizGamePageState();
}

class _QuizGamePageState extends State<QuizGamePage> {
  int indexQuestion = 0;
  int? selectedAnswer;
  int sendAnswer = 0;
  int defaultGame = 1;

  bool? correct;
  GameModel? game;

  //Timer
  Timer? countdownTimer;
  bool restart = false;
  int seconds = 10;
  Duration myDuration = const Duration(seconds: 10);

  @override
  void initState() {
    game = GameModel(quiz: widget.quiz, points: 30, listCorrect: []);
    StartGame();
    super.initState();
  }

  void StartGame() {
    setState(() {
      restart = true;
    });
    startTimer();
  }

  void endRound() {
    if (selectedAnswer == null) {
      game!.listCorrect.add(2);
    }
    setState(() {
      defaultGame = 0;
      sendAnswer = 1;
    });
  }

  void startTimer({bool isStart = false}) {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    if (restart) {
      restart = false;
      seconds = 10;
      myDuration = const Duration(seconds: 10);
    }
    setState(
      () {
        seconds = myDuration.inSeconds - reduceSecondsBy;
        if (seconds < 0) {
          countdownTimer!.cancel();
          endRound();
        } else {
          myDuration = Duration(seconds: seconds);
        }
      },
    );
  }

  void resetGame() {
    StartGame();

    setState(() {
      indexQuestion = 0;
      selectedAnswer = null;
      sendAnswer = 0;
      defaultGame = 1;
      correct = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(1, '0');
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color(0xff9087e5),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.person_2_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '1',
                            style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: LinearProgressIndicator(
                          value: (indexQuestion + 1) * 0.5,
                          backgroundColor: const Color(
                            0xff887be6,
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color(0xffff9b57),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.person_2_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '35',
                            style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: SizedBox(
                      height: size.height - 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: PieChartSample3(qtd: int.parse(seconds)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              "QUESTION ${indexQuestion + 1} OF ${widget.quiz.listQuestions.length}",
                              style: GoogleFonts.rubik(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: SizedBox(
                              height: 300,
                              child: ListView.separated(
                                itemCount: widget
                                    .quiz
                                    .listQuestions[indexQuestion]
                                    .listAnswer
                                    .length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 20,
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        defaultGame = 0;
                                      });
                                      if (sendAnswer == 0) {
                                        setState(
                                          () {
                                            selectedAnswer = index;
                                          },
                                        );
                                      }
                                    },
                                    onDoubleTap: () {
                                      setState(() {
                                        countdownTimer!.cancel();

                                        defaultGame = 0;
                                      });
                                      if (sendAnswer == 0) {
                                        if (widget
                                            .quiz
                                            .listQuestions[indexQuestion]
                                            .listAnswer[index]
                                            .correctAnswer) {
                                          setState(
                                            () {
                                              selectedAnswer = index;
                                              sendAnswer = 1;
                                              correct = true;
                                              game!.listCorrect.add(1);
                                            },
                                          );
                                        } else {
                                          setState(
                                            () {
                                              selectedAnswer = index;
                                              sendAnswer = 1;
                                              correct = false;
                                              game!.listCorrect.add(0);
                                            },
                                          );
                                        }
                                      }
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: defaultGame == 1
                                                ? Colors.grey.shade300
                                                : (index == selectedAnswer &&
                                                        sendAnswer == 1 &&
                                                        !widget
                                                            .quiz
                                                            .listQuestions[
                                                                indexQuestion]
                                                            .listAnswer[index]
                                                            .correctAnswer
                                                    ? Colors.red
                                                    : Colors.grey.shade300),
                                            width: 1.5),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: defaultGame == 1
                                            ? Colors.transparent
                                            : (sendAnswer == 0
                                                ? (selectedAnswer == index
                                                    ? Colors.grey
                                                    : Colors.transparent)
                                                : widget
                                                        .quiz
                                                        .listQuestions[
                                                            indexQuestion]
                                                        .listAnswer[index]
                                                        .correctAnswer
                                                    ? const Color(0xff53df83)
                                                    : Colors.white),
                                      ),
                                      child: Text(
                                        widget.quiz.listQuestions[indexQuestion]
                                            .listAnswer[index].answerT,
                                        style: GoogleFonts.rubik(
                                          color: defaultGame == 1
                                              ? Colors.black
                                              : (sendAnswer == 1 &&
                                                      widget
                                                          .quiz
                                                          .listQuestions[
                                                              indexQuestion]
                                                          .listAnswer[index]
                                                          .correctAnswer
                                                  ? Colors.white
                                                  : (index == selectedAnswer &&
                                                          sendAnswer == 1
                                                      ? Colors.red
                                                      : Colors.black)),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Visibility(
                            visible: sendAnswer == 1,
                            child: Padding(
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
                                    if (widget.quiz.listQuestions.length ==
                                        indexQuestion + 1) {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => InfoEndGamePage(
                                            quiz: widget.quiz,
                                            game: game!,
                                          ),
                                        ),
                                      );
                                    } else {
                                      resetGame();
                                      setState(
                                        () {
                                          indexQuestion++;
                                        },
                                      );
                                    }
                                  },
                                  child: const Text("NEXT"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PieChartSample3 extends StatefulWidget {
  const PieChartSample3({super.key, required this.qtd});
  final int qtd;
  @override
  State<StatefulWidget> createState() => PieChartSample3State();
}

class PieChartSample3State extends State<PieChartSample3> {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: AspectRatio(
        aspectRatio: 2,
        child: Stack(
          children: [
            Center(
              child: Text(
                widget.qtd.toString(),
              ),
            ),
            PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                  },
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 0,
                sections: showingSections(),
              ),
            ),
            Center(
              child: Text(
                widget.qtd.toString(),
                style: GoogleFonts.rubik(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(10, (i) {
      final isTouched = i == touchedIndex;
      final radius = isTouched ? 40.0 : 40.0;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xffffccd5),
            radius: radius,
            value: 20,
            titleStyle: const TextStyle(
              color: Colors.transparent,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: widget.qtd < 1
                ? const Color(0xffffccd5)
                : const Color(0xffff8fa2),
            radius: radius,
            value: 20,
            titleStyle: const TextStyle(
              color: Colors.transparent,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: widget.qtd < 2
                ? const Color(0xffffccd5)
                : const Color(0xffff8fa2),
            radius: radius,
            value: 20,
            titleStyle: const TextStyle(
              color: Colors.transparent,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: widget.qtd < 3
                ? const Color(0xffffccd5)
                : const Color(0xffff8fa2),
            radius: radius,
            value: 20,
            titleStyle: const TextStyle(
              color: Colors.transparent,
            ),
          );
        case 4:
          return PieChartSectionData(
            color: widget.qtd < 4
                ? const Color(0xffffccd5)
                : const Color(0xffff8fa2),
            radius: radius,
            value: 20,
            titleStyle: const TextStyle(
              color: Colors.transparent,
            ),
          );
        case 5:
          return PieChartSectionData(
            color: widget.qtd < 5
                ? const Color(0xffffccd5)
                : const Color(0xffff8fa2),
            radius: radius,
            value: 20,
            titleStyle: const TextStyle(
              color: Colors.transparent,
            ),
          );
        case 6:
          return PieChartSectionData(
            color: widget.qtd < 6
                ? const Color(0xffffccd5)
                : const Color(0xffff8fa2),
            radius: radius,
            value: 20,
            titleStyle: const TextStyle(
              color: Colors.transparent,
            ),
          );
        case 7:
          return PieChartSectionData(
            color: widget.qtd < 7
                ? const Color(0xffffccd5)
                : const Color(0xffff8fa2),
            radius: radius,
            value: 20,
            titleStyle: const TextStyle(
              color: Colors.transparent,
            ),
          );
        case 8:
          return PieChartSectionData(
            color: widget.qtd < 8
                ? const Color(0xffffccd5)
                : const Color(0xffff8fa2),
            radius: radius,
            value: 20,
            titleStyle: const TextStyle(
              color: Colors.transparent,
            ),
          );
        case 9:
          return PieChartSectionData(
            color: widget.qtd < 9
                ? const Color(0xffffccd5)
                : const Color(0xffff8fa2),
            radius: radius,
            value: 20,
            titleStyle: const TextStyle(
              color: Colors.transparent,
            ),
          );
        default:
          throw Exception('Oh no');
      }
    });
  }
}
