import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Pages/Nav/ListFriends_page.dart';
import 'package:quizapp/Pages/Nav/Home/ListQuiz_page.dart';
import 'package:quizapp/Providers/listQuiz_provider.dart';
import 'package:quizapp/Providers/user_provider.dart';
import 'package:quizapp/Services/createQuiz_service.dart';
import 'package:quizapp/utils/const.dart';

import '../../../Database/database.dart';
import '../../../Models/User_model.dart';
import '../../../Models/quiz_model.dart';
import '../../Quiz/QuizInfo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user;
  List<QuizModel>? listQuiz;
  @override
  void initState() {
    ListQuizProvider prov2 = context.read<ListQuizProvider>();
    listQuiz = prov2.listQuiz;
    super.initState();
    UserProvider prov = context.read<UserProvider>();
    user = prov.user;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.sunny,
                            color: Color(0xffffd6dd),
                            size: 15,
                          ),
                        ),
                        Text(
                          "GOOD MORNING",
                          style: GoogleFonts.rubik(
                            fontSize: 12,
                            color: Color(0xffffd6dd),
                          ),
                        ),
                      ],
                    ),
                  ),
                  subtitle: Text(
                    user!.username,
                    style: GoogleFonts.rubik(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Image.network(
                    user!.linkAvatar,
                    scale: 0.5,
                  ),
                ),
              ),
              Padding(
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
                        color: Color.fromARGB(255, 194, 134, 145),
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
                          listQuiz!.length > 0 ? listQuiz![0].title : "QUIZ",
                          style: GoogleFonts.rubik(
                            color: Color(0xff8d3948),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xff9087e5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Text(
                                'FEATURED',
                                style: GoogleFonts.rubik(
                                  color: Color.fromARGB(143, 255, 255, 255),
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(29),
                                child: Text(
                                  'Take part in challenges with friends or other players',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.rubik(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              SizedBox(
                                width: 180,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ListFriendsPage(),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.find_in_page,
                                            color: primaryColor,
                                            size: 23,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Find Friends',
                                              style: GoogleFonts.rubik(
                                                color: primaryColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
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
                                builder: (context) => ListQuizPage(),
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
                                  color:
                                      const Color.fromARGB(255, 206, 200, 200),
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
                                        ? const EdgeInsets.only(
                                            left: 10, top: 10)
                                        : const EdgeInsets.only(
                                            left: 5,
                                            top: 5,
                                            bottom: 5,
                                            right: 5),
                                    child: listQuiz![index].iconImage == null
                                        ? const Icon(Icons.people)
                                        : Image.memory(base64Decode(
                                            listQuiz![index].iconImage!)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: 2,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
