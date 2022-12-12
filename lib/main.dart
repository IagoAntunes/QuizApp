import 'package:flutter/material.dart';
import 'package:quizapp/Pages/SplashScreen_page.dart';

import 'Pages/LoginInfo_page.dart';

void main() async {
  runApp(MaterialApp(home: const SplashScreen()));

  await Future.delayed(const Duration(milliseconds: 2000));

  runApp(MaterialApp(home: LoginInfoPage()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
