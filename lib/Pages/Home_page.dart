import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Pages/ListFriends_page.dart';
import 'package:quizapp/Pages/ListQuiz_page.dart';
import 'package:quizapp/Providers/listQuiz_provider.dart';
import 'package:quizapp/Providers/user_provider.dart';
import 'package:quizapp/Services/createQuiz_service.dart';
import 'package:quizapp/utils/const.dart';

import '../Database/database.dart';
import '../Models/User_model.dart';
import '../Models/quiz_model.dart';

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
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.sunny,
                      color: Color(0xffffd6dd),
                      size: 15,
                    ),
                    Text(
                      "Good Morning",
                      style: GoogleFonts.rubik(
                        fontSize: 12,
                        color: Color(0xffffd6dd),
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  user!.username,
                  style: GoogleFonts.rubik(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
                trailing: const Icon(Icons.person),
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
                          listQuiz![0].title,
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
                        Positioned(
                          child: Image.asset(
                            "assets/images/gamer.png",
                          ),
                        ),
                        const Positioned(
                          right: 1,
                          bottom: 1,
                          child: Icon(Icons.people),
                        ),
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
                                width: 155,
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
                                            size: 18,
                                          ),
                                          Text(
                                            'Find Friends',
                                            style: GoogleFonts.rubik(
                                              color: primaryColor,
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
            height: size.height * 0.34,
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
                            fontSize: 25, fontWeight: FontWeight.bold),
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
                  height: size.height * 0.26,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
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
