import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Models/quiz_model.dart';
import 'package:quizapp/Pages/Nav/Discover/ListCategories_page.dart';
import 'package:quizapp/Pages/Nav/Discover/ListQuiz_page.dart';

import '../../../../Models/User_model.dart';
import '../../../../Models/category_model.dart';
import '../../../../utils/const.dart';

class CardInfos extends StatelessWidget {
  const CardInfos({
    super.key,
    required this.size,
    required this.list,
    required this.indexMaior,
    required this.listCategory,
    required this.listQuiz,
  });

  final Size size;
  final List<User> list;
  final String? indexMaior;
  final List<CategoryModel> listCategory;
  final List<QuizModel> listQuiz;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              padding:
                  const EdgeInsets.only(left: 5, top: 20, right: 5, bottom: 10),
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
                        .where((element) => element.objectId == indexMaior)
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
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: GoogleFonts.rubik(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListCategoriesPage(),
                      )),
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
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              separatorBuilder: (context, index) => const SizedBox(width: 50),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListQuizDiscoverPage(
                      category: listCategory[index],
                    ),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: 130,
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
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xffa0e8d8),
                        ),
                        child: const Icon(
                          Icons.calculate_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        listCategory[index].name,
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${listQuiz.where((element) => element.category.objectId == listCategory[index].objectId).length} Quizzes',
                        style: GoogleFonts.rubik(
                          color: Colors.white54,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
