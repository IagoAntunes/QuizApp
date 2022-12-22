import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Providers/listCategory_provider.dart';
import 'package:quizapp/Providers/listUsers_provider.dart';
import 'package:quizapp/utils/const.dart';

import '../../../Models/User_model.dart';
import '../../../Models/category_model.dart';
import '../../../Models/quiz_model.dart';
import '../../../Providers/listQuiz_provider.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<User> list = [];
  List<QuizModel> listQuiz = [];
  List<CategoryModel> listCategory = [];
  String? indexMaior;
  @override
  void initState() {
    ListUsersProvider prov2 = context.read<ListUsersProvider>();
    ListQuizProvider provQuiz = context.read<ListQuizProvider>();
    ListCategoryProvider provCategory = context.read<ListCategoryProvider>();
    list = prov2.getListUsers;
    listQuiz = provQuiz.getListQuiz();
    listCategory = provCategory.listCategory;

    int maior = 0;
    for (var user in list) {
      if (user.points > maior) {
        indexMaior = user.objectId;
        maior = user.points;
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            actions: null,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            title: const Text('Discover'),
            titleTextStyle:
                GoogleFonts.rubik(fontSize: 24, fontWeight: FontWeight.w500),
            centerTitle: true,
          ),
          backgroundColor: primaryColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xff5b4dc3),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: TextField(
                        style: GoogleFonts.rubik(color: Colors.white),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          border: InputBorder.none,
                          hintText: "Type a Quiz",
                          hintStyle: TextStyle(
                            color: Colors.white30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
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
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  height: size.height - 440,
                  padding: const EdgeInsets.all(25),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Top Rank of the Week',
                          style: GoogleFonts.rubik(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          )
                          // GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 20, right: 5, bottom: 10),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: Color(0xff6a5ae0),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: ListTile(
                              title: Text(
                                list
                                    .where((element) =>
                                        element.objectId == indexMaior)
                                    .first
                                    .username,
                                style: GoogleFonts.rubik(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              subtitle: Text(
                                "${list.where((element) => element.objectId == indexMaior).first.points} points",
                                style: GoogleFonts.rubik(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              leading: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50)),
                                  border: Border.all(color: Colors.white),
                                  color: Colors.transparent,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '1',
                                    style: GoogleFonts.rubik(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, top: 10),
                        child: Text(
                          'Categories',
                          style: GoogleFonts.rubik(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 143,
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 45,
                          childAspectRatio: 1.4,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(255, 154, 221, 207),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Color(0xffa0e8d8),
                                    ),
                                    child: const Icon(
                                      Icons.calculate_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    listCategory[1].name,
                                    style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '${listQuiz.where((element) => element.category.objectId == "OD9ODiMRDC").length} Quizzes',
                                    style: GoogleFonts.rubik(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xff9087e5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Color(0xffa69fea),
                                    ),
                                    child: const Icon(
                                      Icons.science_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    listCategory[0].name,
                                    style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '${listQuiz.where((element) => element.category.objectId == "hrhxD9Jffe").length} Quizzes',
                                    style: GoogleFonts.rubik(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
