import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Pages/Login_Page.dart';
import 'package:quizapp/Pages/Register_page.dart';

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
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        scale: 2.0,
                      ),
                      Text(
                        'Queezy',
                        style: GoogleFonts.rubik(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  "assets/images/peoples.png",
                  height: 230,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  child: Container(
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
                        Text(
                          'Login or Sign Up',
                          style: GoogleFonts.rubik(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            'Login or create an account to take quiz, take part in challenge, and more.',
                            style: GoogleFonts.rubik(color: Color(0xff858494)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff6A5AE0),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'Login',
                              style: GoogleFonts.rubik(fontSize: 16),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterPage(),
                                  ));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffE6E6E6),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                'Create an Account',
                                style: GoogleFonts.rubik(
                                  color: Color(0xff6A5AE0),
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
                              color: Color(0xff858494),
                            ),
                          ),
                        )
                      ],
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
