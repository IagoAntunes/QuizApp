import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Providers/listQuiz_provider.dart';
import 'package:quizapp/Providers/listUsers_provider.dart';
import 'package:quizapp/Providers/user_provider.dart';
import 'package:quizapp/utils/const.dart';

import '../../../Services/Users_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provUser = context.read<UserProvider>();
    final provListUser = context.read<ListUsersProvider>();
    final size = MediaQuery.of(context).size;
    final provQuiz = context.read<ListQuizProvider>();
    void searchUser() {
      for (var user in provListUser.listUsers!) {
        if (user.objectId == provUser.user!.objectId) {}
      }
    }

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.toc_outlined),
          ),
        ],
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: LayoutBuilder(
        builder: (p0, constraints) => SizedBox(
          height: constraints.maxHeight,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 70),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 5,
                child: Image.network(
                  provUser.user!.linkAvatar,
                  scale: 4,
                ),
              ),
              Positioned(
                top: 150,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        provUser.user!.username,
                        style: GoogleFonts.rubik(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      width: size.width * 0.8,
                      decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Icon(
                                Icons.star_border_outlined,
                                color: Colors.white,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  'POINTS',
                                  style: GoogleFonts.rubik(
                                    fontSize: 12,
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                '590',
                                style: GoogleFonts.rubik(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(
                                Icons.language,
                                color: Colors.white,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  'RANK',
                                  style: GoogleFonts.rubik(
                                    fontSize: 12,
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                '#${provListUser.listUsers!.indexWhere((element) => element.objectId == provUser.user!.objectId).toString()}',
                                style: GoogleFonts.rubik(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(
                                Icons.question_answer_outlined,
                                color: Colors.white,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  'QUESTIONS',
                                  style: GoogleFonts.rubik(
                                    fontSize: 12,
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                provQuiz.listQuiz
                                    .where((element) =>
                                        element.user.objectId ==
                                        provUser.user!.objectId)
                                    .length
                                    .toString(),
                                style: GoogleFonts.rubik(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        color: Color(0xffe8e5fa),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: SizedBox(
                            width: 250,
                            child: RichText(
                              textAlign: TextAlign.center,
                              softWrap: true,
                              text: const TextSpan(
                                text: 'You have played a total\n ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                                  TextSpan(
                                    text: '21 Quizzes!',
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Positioned(
                              bottom: 1,
                              right: 10,
                              top: 25,
                              left: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: RichText(
                                  text: TextSpan(
                                    text: '3',
                                    style: GoogleFonts.rubik(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "/2",
                                        style: GoogleFonts.rubik(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 80,
                              width: 80,
                              child: CircularProgressIndicator(
                                value: 0.5,
                                color: Colors.white,
                                backgroundColor: primaryColor,
                                strokeWidth: 9,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        child: Stack(
                          children: [
                            Text('5'),
                            Positioned(
                              bottom: 1,
                              child: Text('ola mundo'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
