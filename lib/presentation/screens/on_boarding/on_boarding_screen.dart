import 'package:car_rental_task/core/component/custom_text.dart';
import 'package:car_rental_task/core/constants/app_string.dart';
import 'package:car_rental_task/core/theme/appcolors/app_colors.dart';
import 'package:car_rental_task/route/route.names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/onboarding.data.model.dart';
import 'widgets.onboarding/dot_indicator_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageviewScreen extends StatefulWidget {
  const PageviewScreen({super.key});

  @override
  State<PageviewScreen> createState() => _PageviewScreenState();
}

class _PageviewScreenState extends State<PageviewScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _nextPage() {
    if (_currentIndex < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    } else {
      Get.toNamed(RouteNames.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  onboardingData[index].image,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 70.r,right: 45.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(color: AppColors.lightTheme,
                    text: onboardingTexts[_currentIndex].title,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold),
                CustomText(color: AppColors.white,
                    text: onboardingTexts[_currentIndex].subtitle,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.r),
            child: Row(
              children: List.generate(
                onboardingData.length,
                (index) => DotIndicatorWidget(
                  currentIndex: _currentIndex,
                  index: index,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 200.r, right: 115.r),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: _nextPage,
                  child: Container(
                    height: 45.h,
                    width: 210.w,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.arrow_forward_ios_sharp,
                            size: 20.sp, color: Colors.grey),
                        Icon(Icons.arrow_forward_ios_sharp,
                            size: 20.sp, color: Colors.black38),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 20.sp,
                          color: CupertinoColors.black,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    height: 45.h,
                    width: 130.w,
                    decoration: BoxDecoration(
                      color: AppColors.general,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Text(
                        AppStrings.onBoardingButtonText,
                        style: GoogleFonts.poppins(fontSize: 16.sp),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
