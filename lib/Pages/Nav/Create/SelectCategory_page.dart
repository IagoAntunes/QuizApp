import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Models/category_model.dart';
import 'package:quizapp/Providers/listCategory_provider.dart';
import 'package:quizapp/store/SelectCategory.store.dart';
import 'package:quizapp/utils/const.dart';

import '../../../Models/quiz_model.dart';
import '../../../Providers/listQuiz_provider.dart';

class SelectCategoryPage extends StatefulWidget {
  const SelectCategoryPage({super.key});

  @override
  State<SelectCategoryPage> createState() => _SelectCategoryPageState();
}

class _SelectCategoryPageState extends State<SelectCategoryPage> {
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
    final store = SelectCategoryStore();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        actions: null,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("Choose Category"),
        titleTextStyle: GoogleFonts.rubik(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(10),
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
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
                    return Observer(
                      builder: (context) => GestureDetector(
                        onTap: () => store.changeSelectedIndex(index),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: store.selectedIndex == index
                                ? Color(0xffff8fa2)
                                : Color(0xffefeefc),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: store.selectedIndex == index
                                      ? Color.fromARGB(255, 247, 182, 194)
                                      : Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: Icon(Icons.people),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  listCategory[index].name,
                                  style: GoogleFonts.rubik(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: store.selectedIndex == index
                                        ? Colors.white
                                        : primaryColor,
                                  ),
                                ),
                              ),
                              Text(
                                "${listQuiz.where((element) => element.category.objectId == listCategory[index].objectId).length.toString()} Quizzes",
                                style: GoogleFonts.rubik(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: store.selectedIndex == index
                                      ? Colors.white
                                      : primaryColor,
                                ),
                              ),
                            ],
                          ),
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
                    onPressed: () {
                      Navigator.pop(context, store.selectedIndex);
                    },
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
