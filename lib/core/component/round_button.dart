import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_size.dart';
import '../theme/appcolors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed;

   const RoundButton({
    super.key,
    this.color = AppColors.darkTheme,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(),
          child: Container(
            height: 55.h.toDouble(),
            decoration: BoxDecoration(
              color: AppColors.general,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: Text(title
              ,style : GoogleFonts.poppins(color: AppColors.darkTheme,fontSize: 16.sp,fontWeight: FontWeight.w400)),
            ),
          ),
        ),
      ),
    );
  }
}


