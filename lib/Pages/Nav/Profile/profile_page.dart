import 'package:flutter/material.dart';
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
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 70),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                            padding: const EdgeInsets.symmetric(vertical: 5),
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
                            Icons.question_answer_outlined,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
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
                            provListUser.listUsers!
                                .indexWhere((element) =>
                                    element.objectId == provUser.user!.objectId)
                                .toString(),
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
                            padding: const EdgeInsets.symmetric(vertical: 5),
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
          )
        ],
      ),
    );
  }
}
