import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Models/quiz_model.dart';
import 'package:quizapp/Pages/Nav/Create/CreateQuestions_page.dart';
import 'package:quizapp/Pages/Nav/Create/SelectCategory_page.dart';
import 'package:quizapp/Pages/Quiz/QuizHome_page.dart';
import 'package:quizapp/utils/const.dart';

import '../../../Models/category_model.dart';

class CreateQuizPage extends StatefulWidget {
  const CreateQuizPage({super.key});

  @override
  State<CreateQuizPage> createState() => _CreateQuizPageState();
}

class _CreateQuizPageState extends State<CreateQuizPage> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerCategory = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();

  List<int> listItems = [1, 2, 3];
  int dropdownValue = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        actions: null,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text('Create Quiz'),
        titleTextStyle:
            GoogleFonts.rubik(fontSize: 24, fontWeight: FontWeight.w500),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: size.height - size.height * 0.15,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Color(0xffefeefc),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_outlined,
                        size: 100,
                        color: primaryColor,
                      ),
                      Text(
                        "Add Cover Image",
                        style: GoogleFonts.rubik(
                          color: primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Title',
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.grey),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: TextField(
                          controller: controllerTitle,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter quiz title',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectCategoryPage(),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            'Quiz Category',
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: primaryColor),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Category"),
                              Icon(Icons.arrow_right),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Description',
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.grey),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: TextField(
                          controller: controllerDescription,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter quiz Description',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: SizedBox()),
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
                        if (controllerCategory.text.toString().isNotEmpty &&
                            controllerTitle.text.toString().isNotEmpty &&
                            controllerDescription.text.toString().isNotEmpty) {
                          QuizModel quiz = QuizModel(
                            title: controllerTitle.text.toString(),
                            description: controllerDescription.text.toString(),
                            listQuestions: [],
                            category: CategoryModel(
                                name: "teste", icon: "teste", objectId: "111"),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizHomePage(quiz: quiz),
                            ),
                          );
                        }
                      },
                      child: const Text("Add Question"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
