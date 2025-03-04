import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/appcolors/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String text;

  const CustomTextField(
      {super.key, required this.controller,  this.onChanged, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.generalGrey,
        hintText: text,
        hintStyle: GoogleFonts.poppins(color: Colors.grey),
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
