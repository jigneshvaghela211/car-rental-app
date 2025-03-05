import 'package:car_rental_task/core/component/custom_text.dart';
import 'package:car_rental_task/core/theme/appcolors/app_colors.dart';
import 'package:car_rental_task/core/constants/app_string.dart';
import 'package:car_rental_task/core/constants/app_size.dart';
import 'package:car_rental_task/data/car_data_manager/car_data_manager.dart';
import 'package:car_rental_task/models/car_model_data.dart';
import 'package:car_rental_task/route/route.names.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToolImageHome extends StatefulWidget {
  final String tool;

  const ToolImageHome({super.key, required this.tool});

  @override
  State<ToolImageHome> createState() => _ToolImageHomeState();
}

class _ToolImageHomeState extends State<ToolImageHome> {
  String selectedCarType = "";
  String selectedCharacteristic = "";
  double minPrice = AppSize.minimum;
  double maxPrice = AppSize.maximum;

  @override
  Widget build(BuildContext context) {
    List<String> carTypes =
        CarDataManager.cars.map((c) => c.carTypes).toSet().toList();
    List<String> characteristicTypes =
        CarDataManager.cars.map((c) => c.characteristics).toSet().toList();

    void applyFilters() {
      List<Car> filteredCars = CarDataManager.cars.where((c) {
        bool matchesPrice = c.carPrice >= minPrice && c.carPrice <= maxPrice;
        bool matchesType = selectedCarType.isEmpty ||
            c.carTypes.trim().toLowerCase() ==
                selectedCarType.trim().toLowerCase();
        bool matchesCharacteristic = selectedCharacteristic.isEmpty ||
            c.characteristics.trim().toLowerCase() ==
                selectedCharacteristic.trim().toLowerCase();

        return matchesPrice && matchesType && matchesCharacteristic;
      }).toList();

      if (filteredCars.isEmpty) {
        Get.back;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomText(
                text: AppStrings.snack,
                fontSize: AppSize.mediumFont,
                fontWeight: FontWeight.bold),
            duration: Duration(seconds: 2),
          ),
        );
        return;
      }
      Get.toNamed(RouteNames.filterCarsScreen,arguments: filteredCars);
    }

    void removeFilters() {
      selectedCarType = "";
      selectedCharacteristic = "";
      minPrice = AppSize.minimum;
      maxPrice = AppSize.maximum;
      Get.back;
    }

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          backgroundColor: Colors.white,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 6.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(AppStrings.titleSheet,
                          style: GoogleFonts.poppins(
                              fontSize: 18.sp, fontWeight: FontWeight.bold)),
                      RangeSlider(
                        min: AppSize.minimum,
                        max: AppSize.maximum,
                        values: RangeValues(minPrice, maxPrice),
                        onChanged: (RangeValues values) {
                          setState(() {
                            minPrice = values.start;
                            maxPrice = values.end;
                          });
                        },
                        activeColor: AppColors.general,
                        inactiveColor: AppColors.generalGrey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Chip(
                            label: Text("\$${minPrice.toInt()}",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500)),
                            backgroundColor: AppColors.general,
                          ),
                          Chip(
                            label: Text("\$${maxPrice.toInt()}",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500)),
                            backgroundColor: AppColors.general,
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Text(AppStrings.typeBottomSheet,
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 70.h,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10.w,
                            mainAxisSpacing: 5.h,
                            childAspectRatio: 3.2,
                          ),
                          itemCount: carTypes.length,
                          itemBuilder: (context, index) {
                            bool isSelected =
                                selectedCarType == carTypes[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCarType =
                                      isSelected ? "" : carTypes[index];
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.h, horizontal: 12.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                      color: isSelected
                                          ? AppColors.general
                                          : AppColors.generalGrey),
                                  color: AppColors.white,
                                ),
                                child: Center(
                                  child: Text(carTypes[index],
                                      style: GoogleFonts.poppins(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: isSelected
                                              ? AppColors.general
                                              : AppColors.darkTheme)),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(AppStrings.vehicleCharacteristic,
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 35.h,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10.w,
                            mainAxisSpacing: 10.h,
                            childAspectRatio: 3,
                          ),
                          itemCount: characteristicTypes.length,
                          itemBuilder: (context, index) {
                            bool isSelected = selectedCharacteristic ==
                                characteristicTypes[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCharacteristic = isSelected
                                      ? ""
                                      : characteristicTypes[index];
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.h, horizontal: 12.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                      color: isSelected
                                          ? AppColors.general
                                          : AppColors.generalGrey),
                                  color: AppColors.white,
                                ),
                                child: Center(
                                  child: Text(characteristicTypes[index],
                                      style: GoogleFonts.poppins(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w500,
                                          color: isSelected
                                              ? AppColors.general
                                              : AppColors.darkTheme)),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                removeFilters();
                              });
                            },
                            child: Container(
                              height: 49.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.generalGrey,
                              ),
                              child: Center(
                                child: Text(AppStrings.bottomSheetButton,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.darkTheme)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: applyFilters,
                            child: Container(
                              height: 49.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.general,
                              ),
                              child: Center(
                                child: Text(AppStrings.bottomSheetTwoButton,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.darkTheme)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child:
            Image.asset(widget.tool, color: AppColors.darkTheme, width: 45.w),
      ),
    );
  }
}
