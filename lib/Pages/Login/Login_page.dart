import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Models/category_model.dart';
import 'package:quizapp/Models/quiz_model.dart';
import 'package:quizapp/Pages/navpage.dart';
import 'package:quizapp/Providers/listCategory_provider.dart';
import 'package:quizapp/Providers/listQuiz_provider.dart';
import 'package:quizapp/Providers/listUsers_provider.dart';
import 'package:quizapp/Providers/user_provider.dart';
import 'package:quizapp/Services/Users_service.dart';
import 'package:quizapp/Services/category_service.dart';
import 'package:quizapp/Services/createQuiz_service.dart';

import '../../Models/User_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final loading = ValueNotifier<bool>(false);
  Future<bool> doUserLogin() async {
    try {
      final username = controllerUsername.text.trim();
      final password = controllerPassword.text.trim();

      final user = ParseUser(username, password, null);
      var response = await user.login();
      User userT = User.fromJson(response.result.toString());
      if (response.success) {
        Provider.of<UserProvider>(context, listen: false).setUser(userT);
        List<QuizModel> list = await CreateQuizService().getListQuiz();
        List<User> listUsers = await UsersService().getUsers();
        List<CategoryModel> listCategory =
            await CategoryService().getCategories();
        Provider.of<ListCategoryProvider>(context, listen: false)
            .setListCategory(listCategory);
        Provider.of<ListQuizProvider>(context, listen: false).setListQuiz(list);
        Provider.of<ListUsersProvider>(context, listen: false)
            .setUsers(listUsers);

        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const NavPage(),
            ),
          );
        }
        return true;
      } else {
        showError(response.error!.message);
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffefeefc),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            'Login',
            style: GoogleFonts.rubik(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Login With Google',
                      style: GoogleFonts.rubik(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xff0056b2),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Login With Facebook',
                      style: GoogleFonts.rubik(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(),
                ),
                Text('Email Address',
                    style: GoogleFonts.rubik(fontWeight: FontWeight.w600)),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 15),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: TextField(
                      controller: controllerUsername,
                      decoration: const InputDecoration(
                        hintText: 'Your email address',
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Color(0xff6A5AE0),
                          size: 20,
                        ),
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Password',
                  style: GoogleFonts.rubik(fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: TextField(
                      controller: controllerPassword,
                      decoration: const InputDecoration(
                        hintText: 'Your Password',
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Color(0xff6A5AE0),
                          size: 20,
                        ),
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                ValueListenableBuilder(
                    valueListenable: loading,
                    builder: (context, value, child) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            if (value == false) {
                              loading.value = true;
                              doUserLogin();
                              loading.value = false;
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff6A5AE0),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: value
                                ? CircularProgressIndicator()
                                : Text('Login'),
                          ),
                        ),
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TextButton(
                    child: Text(
                      'Forgot Password',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik(
                        color: Color(0xff6A5AE0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                // Text(
                //   'By continuing, you agree to the Terms of Services & Privacy Policy',
                //   textAlign: TextAlign.center,
                //   style: GoogleFonts.rubik(
                //     fontWeight: FontWeight.w600,
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
