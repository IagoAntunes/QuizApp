import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Models/answer_model.dart';
import 'package:quizapp/Models/question_model.dart';

import '../../../Models/quiz_model.dart';
import '../../../utils/const.dart';

class CreateQuestionsPage extends StatefulWidget {
  const CreateQuestionsPage({
    super.key,
    required this.quiz,
  });
  final QuizModel quiz;

  @override
  State<CreateQuestionsPage> createState() => _CreateQuestionsPageState();
}

class _CreateQuestionsPageState extends State<CreateQuestionsPage> {
  int? idCorrectAnswer;
  bool correctAnswer = false;
  TextEditingController controllerQuestion = TextEditingController();
  List<AnswerModel> listAnswers = [
    AnswerModel(),
    AnswerModel(),
    AnswerModel(),
    AnswerModel(),
  ];
  List<AnswerModel> listControllers = [];
  @override
  void initState() {
    super.initState();
  }

  void dialog(int index, AnswerModel answer) {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            alignment: Alignment.center,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            title: const Text('Add answer'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.grey),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: TextField(
                    controller: listAnswers[index].controller,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Answer',
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
                CheckboxListTile(
                  title: Text(
                    'Correct Answer',
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  activeColor: Colors.green,
                  value: answer.correctAnswer,
                  onChanged: (value) {
                    setState(() {
                      answer.correctAnswer = value!;
                      idCorrectAnswer = index;
                    });
                  },
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                onPressed: (() {
                  Navigator.pop(context);
                }),
                child: Text(
                  'Voltar',
                  style: GoogleFonts.rubik(),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  onPressed: (() {
                    setState(() {
                      answer.answerT = answer.controller.text.toString();
                    });
                    Navigator.pop(context, true);
                  }),
                  child: Text(
                    'Confirmar',
                    style: GoogleFonts.rubik(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        });
      },
    ).then((value) {
      if (value == true) {
        setState(() {});
      }
    });
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
        title: const Text("Create Questions"),
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
                      const Icon(
                        Icons.image_outlined,
                        size: 100,
                        color: primaryColor,
                      ),
                      Text(
                        "Add Cover Image",
                        style: GoogleFonts.rubik(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Add Question',
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.grey),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: TextField(
                          controller: controllerQuestion,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your Question',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: SizedBox(
                    height: 200,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: 40,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () => dialog(index, listAnswers[index]),
                          child: listAnswers[index].answerT.isEmpty
                              ? Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xffefeefc),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.add,
                                        color: primaryColor,
                                      ),
                                      Text(
                                        'Add answer',
                                        style: GoogleFonts.rubik(
                                          color: primaryColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xffefeefc),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.check,
                                        color: primaryColor,
                                      ),
                                    ],
                                  ),
                                )),
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
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
                        if (controllerQuestion.text.toString().isNotEmpty) {
                          widget.quiz.listQuestions.add(
                            QuestionModel(
                              question: controllerQuestion.text.toString(),
                              listAnswer: listAnswers,
                              answer: correctAnswer,
                            ),
                          );

                          Navigator.pop(context, widget.quiz);
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
