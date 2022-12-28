import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Services/Users_service.dart';
import 'package:quizapp/utils/const.dart';

import '../../Models/userT_model.dart';

class ListFriendsPage extends StatelessWidget {
  ListFriendsPage({super.key});
  List<User> listUsers = [];
  Future<bool> getUsers() async {
    listUsers = await UsersService().getUsers();
    listUsers.sort(
      (a, b) => b.points.compareTo(a.points),
    );

    return true;
  }

  List<Color> listColors = [Colors.amber, Colors.grey, Colors.brown];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        actions: null,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text('Users'),
        titleTextStyle:
            GoogleFonts.rubik(fontSize: 24, fontWeight: FontWeight.w500),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xffefeefc),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                height: size.height,
                child: ListView.separated(
                  itemCount: listUsers.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          //Posicao
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                            ),
                            child: Text(
                              "${index + 1}",
                              style: GoogleFonts.rubik(
                                fontSize: 22,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          //Icone
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Image.network(
                              listUsers[index].linkAvatar,
                              scale: 8,
                            ),
                          ),
                          //Textos
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listUsers[index].username.length <= 8
                                      ? listUsers[index].username
                                      : listUsers[index]
                                          .username
                                          .substring(0, 9),
                                  overflow: TextOverflow.clip,
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "${listUsers[index].points} points",
                                  style: GoogleFonts.rubik(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          //Coroa
                          index + 1 < 4
                              ? Container(
                                  decoration: const BoxDecoration(),
                                  child: Image.asset(
                                    "assets/images/crown.png",
                                    scale: 2.0,
                                    color: listColors[index],
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
        },
      ),
    );
  }
}
