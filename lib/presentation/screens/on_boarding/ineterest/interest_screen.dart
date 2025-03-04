import 'package:car_rental_task/core/component/custom_text.dart';
import 'package:car_rental_task/core/constants/app_size.dart';
import 'package:car_rental_task/core/constants/app_string.dart';
import 'package:car_rental_task/core/theme/appcolors/app_colors.dart';
import 'package:car_rental_task/data/car_data_manager/car_data_manager.dart';
import 'package:car_rental_task/models/car_model_data.dart';
import 'package:car_rental_task/presentation/homescreen/home_screen.dart';
import 'package:car_rental_task/core/component/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'choice_widget.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  List<int> selectedIndices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(
                                filteredCars: CarDataManager.cars,
                              )));
                },
                child: Container(
                  height: 45.h,
                  width: 65.w,
                  margin: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                    color: AppColors.general,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                      child: CustomText(
                          text: AppStrings.buttonText,
                          fontSize: AppSize.mediumFont,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: AppStrings.headerText,
                      fontSize: AppSize.doubleELFont,
                      fontWeight: FontWeight.bold),
                  SizedBox(height: 5.h),
                  CustomText(color: Colors.grey,
                      text: AppStrings.headerSubtitle,
                      fontSize: AppSize.mediumFont,
                      fontWeight: FontWeight.w500),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: CarBrand.carBrandList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      final car = CarBrand.carBrandList[index];
                      bool isSelected = selectedIndices.contains(index);

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedIndices.remove(index);
                            } else {
                              selectedIndices.add(index);
                            }
                          });
                        },
                        child: ChoiceWidget(
                          brandName: car.brandName,
                          brandImage: car.brandLogo,
                          isSelected: isSelected,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: RoundButton(
              title: AppStrings.bottomButtonText,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen(
                              filteredCars: CarDataManager.cars,
                            )));
              },
            ),
          ),
        ],
      ),
    );
  }
}
