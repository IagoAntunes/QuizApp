import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Pages/Nav/Discover/widgets/CardInfos_widget.dart';
import 'package:quizapp/Pages/Nav/Discover/widgets/CardTopPicks_widget.dart';
import 'package:quizapp/Pages/Nav/Discover/widgets/FieldSearch_widget.dart';
import 'package:quizapp/Providers/listCategory_provider.dart';
import 'package:quizapp/Providers/listUsers_provider.dart';
import 'package:quizapp/utils/const.dart';

import '../../../Models/category_model.dart';
import '../../../Models/quiz_model.dart';
import '../../../Models/userT_model.dart';
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
                const FieldSearch(),
                CardTopPicks(size: size, listQuiz: listQuiz),
                const SizedBox(height: 18),
                CardInfos(
                  size: size,
                  list: list,
                  indexMaior: indexMaior,
                  listCategory: listCategory,
                  listQuiz: listQuiz,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
