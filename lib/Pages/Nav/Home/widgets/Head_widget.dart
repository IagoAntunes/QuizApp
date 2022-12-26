import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Models/userT_model.dart';

class Head extends StatelessWidget {
  const Head({
    super.key,
    required this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.sunny,
                  color: Color(0xffffd6dd),
                  size: 15,
                ),
              ),
              Text(
                "GOOD MORNING",
                style: GoogleFonts.rubik(
                  fontSize: 12,
                  color: const Color(0xffffd6dd),
                ),
              ),
            ],
          ),
        ),
        subtitle: Text(
          user!.username,
          style: GoogleFonts.rubik(
            fontSize: 26,
            color: Colors.white,
          ),
        ),
        trailing: Image.network(
          user!.linkAvatar,
          scale: 0.5,
        ),
      ),
    );
  }
}
