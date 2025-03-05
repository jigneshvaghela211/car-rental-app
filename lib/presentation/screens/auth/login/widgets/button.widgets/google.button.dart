import 'package:car_rental_task/core/component/custom_text.dart';
import 'package:car_rental_task/core/constants/app_size.dart';
import 'package:car_rental_task/core/constants/image_strings.dart';
import 'package:car_rental_task/route/route.names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../core/constants/app_string.dart';
import '../../../../../../core/theme/appcolors/app_colors.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      Get.toNamed(RouteNames.googleScreen);
     },
      child: Container(
        height: 55.h,
        width: 160.w,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.subTitle),
            borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageStrings.google,height: 24.h,),
            CustomText(text: AppStrings.google, fontSize: AppSize.extraLargeFont, fontWeight: FontWeight.w500),
          ],
        ),
      ),
    );
  }
}
