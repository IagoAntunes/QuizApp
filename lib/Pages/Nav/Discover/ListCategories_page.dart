import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Pages/Nav/Home/ListQuiz_page.dart';

import '../../../Models/category_model.dart';
import '../../../Models/quiz_model.dart';
import '../../../Providers/listCategory_provider.dart';
import '../../../Providers/listQuiz_provider.dart';
import '../../../utils/const.dart';
import 'ListQuiz_page.dart';

class ListCategoriesPage extends StatefulWidget {
  const ListCategoriesPage({super.key});

  @override
  State<ListCategoriesPage> createState() => _ListCategoriesPageState();
}

class _ListCategoriesPageState extends State<ListCategoriesPage> {
  List<CategoryModel> listCategory = [];
  List<QuizModel> listQuiz = [];
  @override
  void initState() {
    ListCategoryProvider prov = context.read<ListCategoryProvider>();
    listQuiz = Provider.of<ListQuizProvider>(context, listen: false).listQuiz;
    listCategory = prov.listCategory;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        actions: null,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text("Choose Category"),
        titleTextStyle: GoogleFonts.rubik(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(10),
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: listCategory.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListQuizDiscoverPage(
                            category: listCategory[index],
                          ),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Color(0xffefeefc),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: const Icon(Icons.people),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                listCategory[index].name,
                                style: GoogleFonts.rubik(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                            Text(
                              "${listQuiz.where((element) => element.category.objectId == listCategory[index].objectId).length.toString()} Quizzes",
                              style: GoogleFonts.rubik(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: SizedBox(
                  width: size.width,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Next"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
