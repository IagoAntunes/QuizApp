import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Pages/SplashScreen_page.dart';
import 'package:quizapp/Providers/listQuiz_provider.dart';
import 'package:quizapp/Providers/listUsers_provider.dart';
import 'package:quizapp/utils/const.dart';

import 'Pages/Login/LoginInfo_page.dart';
import 'Providers/user_provider.dart';

void main() async {
  runApp(const MaterialApp(home: SplashScreen()));

  await Future.delayed(const Duration(milliseconds: 2000));
  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ListQuizProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ListUsersProvider(),
        )
      ],
      child: const MaterialApp(home: LoginInfoPage()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuizGame',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
