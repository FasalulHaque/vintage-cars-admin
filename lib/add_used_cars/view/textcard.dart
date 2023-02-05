import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextCardd extends StatelessWidget {
  TextCardd({Key? key, required this.controller,required this.labelText}) : super(key: key);

  TextEditingController controller;
  String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 10,
        ),
        labelText: labelText,
        labelStyle: GoogleFonts.abel(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
