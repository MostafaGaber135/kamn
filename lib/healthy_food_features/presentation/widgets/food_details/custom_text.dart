import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  String text;
  double size;
  FontWeight weight;
  Color color;

  CustomText(this.text, this.size, this.weight, {super.key, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          GoogleFonts.poppins(fontSize: size, fontWeight: weight, color: color),
    );
  }
}
