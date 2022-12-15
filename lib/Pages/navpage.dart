import 'package:flutter/material.dart';
import 'package:quizapp/Pages/CreateQuestions_page.dart';
import 'package:quizapp/Pages/CreateQuiz_page.dart';
import 'package:quizapp/Pages/Discover_page.dart';
import 'package:quizapp/Pages/Home_page.dart';
import 'package:quizapp/utils/const.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int currentIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    const DiscoverPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: size.height - 80,
              child: pages[currentIndex],
            ),
            Container(
              width: double.infinity,
              height: 80,
              decoration: const BoxDecoration(
                color: Color(0x00EEEEEE),
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 70,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: Color(0x1A57636C),
                                offset: Offset(0, -10),
                                spreadRadius: 0.1,
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              if (currentIndex != 0) {
                                currentIndex = 0;
                              }
                            },
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.transparent, width: 1),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: Icon(
                            Icons.home_rounded,
                            color: currentIndex == 0
                                ? Colors.black
                                : const Color(0xFF9299A1),
                            size: 24,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              if (currentIndex != 1) {
                                currentIndex = 1;
                              }
                            },
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.transparent, width: 1),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: Icon(
                            Icons.search,
                            color: currentIndex == 1
                                ? Colors.black
                                : const Color(0xFF9299A1),
                            size: 24,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CreateQuizPage(),
                                    ));
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.transparent, width: 1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                    color: Colors.blue),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (currentIndex != 2) {
                              currentIndex = 2;
                            }
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.transparent, width: 1),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: Icon(
                            Icons.graphic_eq,
                            color: currentIndex == 2
                                ? Colors.black
                                : const Color(0xFF9299A1),
                            size: 24,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              if (currentIndex != 3) {
                                currentIndex = 3;
                              }
                            },
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.transparent, width: 1),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: Icon(
                            Icons.person_2_outlined,
                            color: currentIndex == 3
                                ? Colors.black
                                : const Color(0xFF9299A1),
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
