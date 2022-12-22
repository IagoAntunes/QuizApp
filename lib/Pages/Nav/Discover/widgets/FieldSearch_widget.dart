import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FieldSearch extends StatelessWidget {
  const FieldSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xff5b4dc3),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: TextField(
            style: GoogleFonts.rubik(color: Colors.white),
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              border: InputBorder.none,
              hintText: "Type a Quiz",
              hintStyle: TextStyle(
                color: Colors.white30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
