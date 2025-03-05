import 'package:car_rental_task/route/route.names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/component/custom_text.dart';
import '../../../core/constants/app_size.dart';
import '../../../core/constants/app_string.dart';
import '../../../core/constants/image_strings.dart';
import '../../../core/theme/appcolors/app_colors.dart';
import '../../../models/location_data_model.dart';
import '../../common.widgets/image.widget.dart';
import 'car_filter_tool.dart';

class HomeScreenHeaderCard extends StatefulWidget {
  String selectedLocation;
  String searchName;
 final Function(String) onSearchChanged;

  HomeScreenHeaderCard({super.key, required this.selectedLocation, required this.searchName, required this.onSearchChanged,});

  @override
  State<HomeScreenHeaderCard> createState() => _HomeScreenHeaderCardState();
}

class _HomeScreenHeaderCardState extends State<HomeScreenHeaderCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          HomeMenuImage(menu: ImageStrings.menu),
          GestureDetector(
            onTap: () async {
              final result = await
                  Get.toNamed(RouteNames.searchScreen,arguments: LocationDataModel.locationDataProvider[0]);
              if (result is String) {
                setState(() => widget.selectedLocation = result);
              }
            },
            child: Row(
              children: [
                Icon(Icons.location_on_outlined, size: 22.sp),
                Text(
                  widget.selectedLocation,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 14.sp),
                ),
                Icon(Icons.keyboard_arrow_down_sharp, size: 22.sp),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: HomeScreenProfile(profile: ImageStrings.me),
          ),
        ]),
        SizedBox(height: 20.h),
        Row(children: [
          CustomText(text: AppStrings.homeHeader,
              fontSize: AppSize.doubleELFont,
              fontWeight: FontWeight.bold),
          WaveImage(wave: ImageStrings.waveImage),
        ]),
        CustomText(text: AppStrings.homeSubtitle,
            fontSize: AppSize.largeFont,
            fontWeight: FontWeight.w500),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 45.h,
              width: 285.w,
              decoration: BoxDecoration(
                color: AppColors.generalGrey,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10.w),
                  Icon(Icons.search_outlined, size: 30.sp),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        widget.onSearchChanged(value);
                      },
                      decoration: InputDecoration(
                        hintText: AppStrings.search,
                        hintStyle: GoogleFonts.poppins(
                            color: Colors.grey, fontSize: 14.sp),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: AppColors.general,
                    borderRadius: BorderRadius.circular(10)),
                child: ToolImageHome(tool: ImageStrings.toolTwo)),
          ],
        ),
        SizedBox(height: 30.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: AppStrings.trendBrand,
                fontSize: AppSize.extraLargeFont,
                fontWeight: FontWeight.bold),
            CustomText(text: AppStrings.viewAll,
                fontSize: AppSize.mediumFont,
                fontWeight: FontWeight.w500),
          ],
        ),
      ],
    );
  }
}
