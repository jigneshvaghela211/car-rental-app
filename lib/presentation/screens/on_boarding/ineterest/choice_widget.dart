import 'package:car_rental_task/core/component/custom_text.dart';
import 'package:car_rental_task/core/constants/app_size.dart';
import 'package:car_rental_task/core/theme/appcolors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoiceWidget extends StatelessWidget {
  final String brandName;
  final String brandImage;
  final bool isSelected;

  const ChoiceWidget({
    super.key,
    required this.brandName,
    required this.brandImage,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.generalGrey,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: isSelected ? AppColors.general : Colors.grey,
          width: isSelected ? 2.0.w : 1.0.w,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(brandImage, height: 80.h),
          SizedBox(height: 5.h),
          CustomText(text: brandName, fontSize: AppSize.largeFont, fontWeight: FontWeight.w500),
        ],
      ),
    );
  }
}
