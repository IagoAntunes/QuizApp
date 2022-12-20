import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../../utils/const.dart';
import 'LoginInfo_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController controllerUsername = TextEditingController();

  TextEditingController controllerEmail = TextEditingController();

  TextEditingController controllerPassword = TextEditingController();

  int selectedIndex = 0;

  void showSuccess(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: const Text("User was successfully created!"),
          actions: <Widget>[
            FloatingActionButton(
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

  void showError(String errorMessage, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            FloatingActionButton(
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
    return Scaffold(
      backgroundColor: const Color(0xffefeefc),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Register',
          style: GoogleFonts.rubik(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: GoogleFonts.rubik(fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: TextField(
                        controller: controllerUsername,
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.people,
                            color: Color(0xff6A5AE0),
                            size: 20,
                          ),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: GoogleFonts.rubik(fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: TextField(
                        controller: controllerEmail,
                        decoration: const InputDecoration(
                          hintText: 'Email',
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
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: GoogleFonts.rubik(fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: TextField(
                        controller: controllerPassword,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.people,
                            color: Color(0xff6A5AE0),
                            size: 20,
                          ),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: listAvatarImages.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 20,
                    ),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () => setState(() {
                              selectedIndex = index;
                            }),
                            child: SizedBox(
                              height: 90,
                              child: Image.network(
                                listAvatarImages[index],
                              ),
                            ),
                          ),
                          if (selectedIndex == index)
                            Positioned(
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff6A5AE0),
        onPressed: () async {
          final username = controllerUsername.text.trim();
          final email = controllerEmail.text.trim();
          final password = controllerPassword.text.trim();

          late final user = ParseUser.createUser(username, password, email)
            ..set("linkAvatar", listAvatarImages[selectedIndex]);

          var response = await user.signUp();

          if (response.success) {
            showSuccess(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginInfoPage(),
                ));
          } else {
            showError(response.error!.message, context);
          }
        },
        child: const Icon(
          Icons.create,
          color: Colors.white,
        ),
      ),
    );
  }
}
