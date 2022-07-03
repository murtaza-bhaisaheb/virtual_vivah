import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VVTextField extends StatelessWidget {
  const VVTextField({
    Key? key,
    required this.label,
    required this.obscureText,
    this.controller,
    this.textType = TextInputType.name,
  }) : super(key: key);

  final String label;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType textType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: textType,
      obscuringCharacter: "*",
      style: GoogleFonts.inter(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF000000),
      ),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 0, vertical: 2),
        label: AutoSizeText(
          label,
          maxLines: 1,
        ),
        labelStyle: GoogleFonts.inter(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: const Color.fromRGBO(159, 159, 159, 1),
        ),
        floatingLabelStyle: GoogleFonts.inter(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: const Color.fromRGBO(159, 159, 159, 1),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: Color.fromRGBO(252, 86, 102, 1),
              width: 1.5),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(252, 86, 102, 1),
            width: 1.5,
          ),
        ),
      ),
    );
  }
}