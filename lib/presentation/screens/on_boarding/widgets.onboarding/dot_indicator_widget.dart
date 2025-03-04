import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/appcolors/app_colors.dart';

class DotIndicatorWidget extends StatelessWidget {
  const DotIndicatorWidget({super.key, required this.currentIndex, required this.index});
 final int currentIndex;
 final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 160.h),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            width: currentIndex == index ? 12.w : 8.w,
            height: currentIndex == index ? 12.h : 8.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == index ? AppColors.general : Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
