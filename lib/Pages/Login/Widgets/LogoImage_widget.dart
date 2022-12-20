import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
