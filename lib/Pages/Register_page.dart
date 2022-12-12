import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:quizapp/Pages/LoginInfo_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final keyApplicationId = 'rEe5OVkoHsWOc3igs1ofd7vvy0EqKhdStryjaKWJ';

  final keyClientKey = 'YXxvvcmBBQMgUHBEUsWJaVdcW3aldSpQ2u0s3gwB';

  final keyParseServerUrl = 'https://parseapi.back4app.com';

  TextEditingController controllerUsername = TextEditingController();

  TextEditingController controllerEmail = TextEditingController();

  TextEditingController controllerPassword = TextEditingController();

  @override
  void initState() {
    inicia();
    super.initState();
  }

  void inicia() async {
    await Parse().initialize(keyApplicationId, keyParseServerUrl,
        clientKey: keyClientKey, debug: true);
  }

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
            new FloatingActionButton(
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
        title: const Text(
          'Register',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.w600),
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
                const Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.w600),
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
                const Text(
                  'Password',
                  style: TextStyle(fontWeight: FontWeight.w600),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff6A5AE0),
        onPressed: () async {
          final username = controllerUsername.text.trim();
          final email = controllerEmail.text.trim();
          final password = controllerPassword.text.trim();

          late final user = ParseUser.createUser(username, password, email);

          var response = await user.signUp();

          if (response.success) {
            showSuccess(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginInfoPage(),
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
