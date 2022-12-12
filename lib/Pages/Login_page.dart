import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffefeefc),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
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
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Login With Google',
                  style: TextStyle(
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
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Login With Facebook',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(),
            ),
            const Text('Email Address',
                style: TextStyle(fontWeight: FontWeight.w600)),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 15),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: const TextField(
                  decoration: InputDecoration(
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
            const Text(
              'Password',
              style: TextStyle(fontWeight: FontWeight.w600),
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
                child: const TextField(
                  decoration: InputDecoration(
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
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6A5AE0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Login'),
                ),
              ),
            ),
            TextButton(
              child: const Text(
                'Forgot Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff6A5AE0),
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {},
            ),
            const Text(
              'By continuing, you agree to the Terms of Services & Privacy Policy',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
