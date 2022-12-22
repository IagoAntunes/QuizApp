import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Models/category_model.dart';

import '../../../Models/quiz_model.dart';
import '../../../Providers/listQuiz_provider.dart';
import '../../../Services/createQuiz_service.dart';
import '../../../utils/const.dart';
import '../../Quiz/QuizInfo_page.dart';

class ListQuizDiscoverPage extends StatefulWidget {
  const ListQuizDiscoverPage({super.key, required this.category});
  final CategoryModel category;
  @override
  State<ListQuizDiscoverPage> createState() => _ListQuizDiscoverPageState();
}

class _ListQuizDiscoverPageState extends State<ListQuizDiscoverPage> {
  List<QuizModel> listQuiz = [];
  @override
  void initState() {
    ListQuizProvider provQuiz = context.read<ListQuizProvider>();
    listQuiz = provQuiz.listQuiz;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              List<QuizModel> list = await CreateQuizService().getListQuiz();
              ListQuizProvider provQuiz = context.read<ListQuizProvider>();
              //Ok SetState
              setState(() {
                Provider.of<ListQuizProvider>(context, listen: false)
                    .setListQuiz(list);
                listQuiz = provQuiz.listQuiz;
              });
            },
            icon: const Icon(Icons.sync),
          ),
        ],
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text("List Quiz"),
        titleTextStyle:
            GoogleFonts.rubik(fontSize: 24, fontWeight: FontWeight.w500),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: size.height,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 247, 244, 244),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: ListView.builder(
            itemCount: listQuiz
                .where((element) =>
                    element.category.objectId == widget.category.objectId)
                .length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizInfoPage(quiz: listQuiz[index]),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 155, 144, 236),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        listQuiz[index].title,
                        style: GoogleFonts.rubik(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        "${listQuiz[index].listQuestions.length} points",
                        style: GoogleFonts.rubik(
                          color: Colors.white60,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      leading: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white),
                          color: Colors.transparent,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "${index + 1}".toString(),
                            style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.arrow_right,
                          size: 35,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
