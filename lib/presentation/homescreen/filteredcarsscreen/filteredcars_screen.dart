import 'package:car_rental_task/core/component/custom_app_bar.dart';
import 'package:car_rental_task/core/constants/app_string.dart';
import 'package:car_rental_task/core/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/appcolors/app_colors.dart';
import '../../../models/car_model_data.dart';
import '../../../models/favorite_screen_list.dart';
import '../homescreen_widgets/car_presentation_card.dart';

class FilteredCarsScreen extends StatefulWidget {
  final List<Car> filtredCars;
  const FilteredCarsScreen({super.key, required this.filtredCars});

  @override
  State<FilteredCarsScreen> createState() => _FilteredCarsScreenState();
}

class _FilteredCarsScreenState extends State<FilteredCarsScreen> {
  List<String> modeList = [
    AppStrings.recommended,
    AppStrings.newModel,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: AppStrings.allCars),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.generalGrey,
                hintText: AppStrings.search,
                hintStyle: GoogleFonts.poppins(color: Colors.grey),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r)),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                   Get.back;
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                        color: AppColors.general,
                        borderRadius: BorderRadius.circular(10.r)),
                    height: 45.h,
                    child: Row(
                      children: [
                        Image.asset(
                          ImageStrings.toolTwo,
                          color: Colors.black,
                          height: 20.h,
                        ),
                        Text(
                          " Filter",
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.h,
                ),
                SizedBox(
                  width: 245.w,
                  height: 45.h,
                  child: ListView.builder(
                    itemCount: modeList.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 10.r),
                        child: Container(
                          padding: EdgeInsets.all(6.r),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Row(
                            children: [
                              Text(
                                modeList[index],
                                style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.filtredCars.length,
                padding: EdgeInsets.only(top: 20.r),
                itemBuilder: (context, index) {
                  return PopularCars(carProduct: widget.filtredCars[index],favButton: (){
                    final car =  widget.filtredCars[index];
                    Fav.favoriteCars.add(car);
                  },);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
