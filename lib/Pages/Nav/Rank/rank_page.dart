import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Providers/user_provider.dart';
import 'package:quizapp/utils/const.dart';

import '../../../Models/userT_model.dart';
import '../../../Services/Users_service.dart';

class RankPage extends StatelessWidget {
  RankPage({super.key});
  List<User> listUsers = [];
  Future<bool> getUsers() async {
    listUsers = await UsersService().getUsers();
    listUsers.removeRange(0, 3);
    listUsers.sort(
      (a, b) => b.points.compareTo(a.points),
    );

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final provUser = context.read<UserProvider>();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        actions: null,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text('Rank'),
        titleTextStyle:
            GoogleFonts.rubik(fontSize: 24, fontWeight: FontWeight.w500),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getUsers(),
        builder: (context, snapshot) => Stack(
          fit: StackFit.expand,
          children: [
            Container(
              height: 380,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      height: 350,
                      child: Column(
                        children: [
                          Image.network(
                            listUsers[1].linkAvatar,
                            scale: 8,
                          ),
                          Text(
                            listUsers[1].username,
                            style: GoogleFonts.rubik(
                              fontSize:
                                  listUsers[1].username.length > 6 ? 20 : 28,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              width: 70,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Color(0xff9087e5),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Text(
                                '${listUsers[1].points.toString()} points',
                                style: GoogleFonts.rubik(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            height: 170,
                            width: 105,
                            decoration:
                                const BoxDecoration(color: Color(0xff9087e5)),
                            child: Text(
                              '2',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.rubik(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 350,
                    child: Column(
                      children: [
                        Image.network(
                          listUsers[0].linkAvatar,
                          scale: 8,
                        ),
                        Text(
                          listUsers[0].username,
                          style: GoogleFonts.rubik(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Color(0xff9087e5),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Text(
                              '${listUsers[0].points.toString()} points',
                              style: GoogleFonts.rubik(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          height: 200,
                          width: 105,
                          decoration:
                              const BoxDecoration(color: Color(0xff9087e5)),
                          child: Text(
                            '1',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.rubik(
                              fontSize: 70,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Container(
                      height: 350,
                      child: Column(
                        children: [
                          Image.network(
                            listUsers[2].linkAvatar,
                            scale: 8,
                          ),
                          Text(
                            listUsers[2].username,
                            style: GoogleFonts.rubik(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Color(0xff9087e5),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Text(
                                listUsers[2].points.toString(),
                                style: GoogleFonts.rubik(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 105,
                            decoration:
                                const BoxDecoration(color: Color(0xff9087e5)),
                            child: Text(
                              '3',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.rubik(
                                fontSize: 52,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              height: 280,
              width: size.width,
              bottom: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: const BoxDecoration(
                    color: Color(0xffefeefc),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  height: 400,
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
                                "${index + 4}",
                                style: GoogleFonts.rubik(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            //Icone
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Image.network(
                                listUsers[index].linkAvatar,
                                scale: 10,
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
                                      fontSize: 14,
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
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
