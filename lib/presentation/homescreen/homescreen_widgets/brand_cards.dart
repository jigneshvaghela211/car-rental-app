import 'package:car_rental_task/core/theme/appcolors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TrendingBrands extends StatefulWidget {
  final String brandName;
  final String brandImage;
  final bool isSelected;

  const TrendingBrands({
    super.key,
    required this.brandName,
    required this.brandImage,
    required this.isSelected,
  });

  @override
  State<TrendingBrands> createState() => _TrendingBrandsState();
}

class _TrendingBrandsState extends State<TrendingBrands> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, top: 15.h, right: 5.w),
      child: Column(
        children: [
          Container(
            height: 60.r,
            width: 60.r,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: AppColors.iconsColor, blurRadius: 5.r)],
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: Image.asset(
                widget.brandImage,
                height: 35.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            widget.brandName,
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
