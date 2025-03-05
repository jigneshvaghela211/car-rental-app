import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LargeText extends StatelessWidget {
  final String text;
  const LargeText({super.key, required this.text,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, top: 40.h, bottom: 16.h),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 24.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
