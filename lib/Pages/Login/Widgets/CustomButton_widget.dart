import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Login_page.dart';

class Custom_Button extends StatelessWidget {
  Custom_Button({
    super.key,
    required this.onPressed,
    required this.title,
  });
  Function() onPressed;
  String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff6A5AE0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          title,
          style: GoogleFonts.rubik(fontSize: 16),
        ),
      ),
    );
  }
}
