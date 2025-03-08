import 'package:car_rental_task/core/component/custom_text.dart';
import 'package:car_rental_task/core/constants/app_size.dart';
import 'package:car_rental_task/core/utils/helper.dart';
import 'package:car_rental_task/route/route.names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../../core/constants/app_string.dart';
import '../../../../../../core/theme/appcolors/app_colors.dart';

class FaceBookButton extends StatelessWidget {
  const FaceBookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(onTap: (){
      Get.toNamed(RouteNames.faceBookScreen);
      },
      child: Container(
        height: 55.h,
        width: 160.w,
        decoration: BoxDecoration(
            border: Border.all(color: Helper.isDarkMode(context)? Colors.white: AppColors.subTitle),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.facebook,
                color: AppColors.faceBook,size: AppSize.extraLargeFont.sp,),
            CustomText(text: AppStrings.faceBook,fontSize: AppSize.extraLargeFont, fontWeight: FontWeight.w500),

          ],
        ),
      ),
    );
  }
}
