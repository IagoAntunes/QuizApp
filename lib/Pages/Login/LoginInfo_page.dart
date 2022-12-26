import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Pages/Login/Login_page.dart';
import 'package:quizapp/Pages/Login/Register_page.dart';

import 'Widgets/CustomButton_widget.dart';
import 'Widgets/ImagePeoples_widget.dart';
import 'Widgets/LogoImage_widget.dart';

class LoginInfoPage extends StatelessWidget {
  const LoginInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff6A5AE0),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background2.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const LogoImage(),
                const ImagePoples(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 40),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Login or Sign Up',
                            style: GoogleFonts.rubik(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 25,
                            ),
                            child: Text(
                              'Login or create an account to take quiz, take part in challenge, and more.',
                              style: GoogleFonts.rubik(
                                  color: const Color(0xff858494)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Custom_Button(
                            title: 'Login',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage(),
                                    ));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffE6E6E6),
                                elevation: 0,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  'Create an Account',
                                  style: GoogleFonts.rubik(
                                    color: const Color(0xff6A5AE0),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Later',
                              style: GoogleFonts.rubik(
                                fontSize: 17,
                                color: const Color(0xff858494),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
