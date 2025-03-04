import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message,style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
      duration: Duration(seconds: 2),
    ),
  );
}