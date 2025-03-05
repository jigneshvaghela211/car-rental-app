import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_string.dart';
import '../../../core/theme/appcolors/app_colors.dart';
import '../../../models/car_model_data.dart';

class ProductScreenBody extends StatefulWidget {
  final Car car;
  const ProductScreenBody({super.key, required this.car});

  @override
  State<ProductScreenBody> createState() => _ProductScreenBodyState();
}

class _ProductScreenBodyState extends State<ProductScreenBody> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Image.asset(widget.car.carImage),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 110.h,
                width: 110.w,
                decoration: BoxDecoration(
                  color: AppColors.generalGrey,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.offline_bolt_outlined,
                        size: 25.sp,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 5.h),
                      Text(AppStrings.engineO,
                          style: GoogleFonts.poppins(
                              color: Colors.black, fontSize: 12.sp)),
                      SizedBox(height: 3.h),
                      Text("${widget.car.engine.toInt()} hp",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Container(
                height: 110.h,
                width: 110.w,
                decoration: BoxDecoration(
                  color: AppColors.generalGrey,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.display_settings,
                        size: 25.sp,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 5.h),
                      Text(AppStrings.transmission,
                          style: GoogleFonts.poppins(
                              color: Colors.black, fontSize: 12.sp)),
                      SizedBox(height: 3.h),
                      Text(widget.car.characteristics,
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Container(
                height: 110.h,
                width: 110.w,
                decoration: BoxDecoration(
                  color: AppColors.generalGrey,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.local_gas_station,
                        size: 25.sp,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 5.h),
                      Text(AppStrings.fuelType,
                          style: GoogleFonts.poppins(
                              color: Colors.black, fontSize: 12.sp)),
                      SizedBox(height: 3.h),
                      Text(widget.car.fuelType,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Text(AppStrings.description,
              style: GoogleFonts.poppins(
                  fontSize: 20.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 5.h),
          Text(widget.car.description,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
          SizedBox(height: 20.h),
          Text(AppStrings.bestF,
              style: GoogleFonts.poppins(
                  fontSize: 20.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 20.h),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color: AppColors.generalGrey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.bluetooth,
                      size: 25.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    AppStrings.blueCon,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 100.w,
                  ),
                  Text(
                    widget.car.bluetooth ? "Yes" : "No",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Divider(
                height: 40.h,
                endIndent: 1,
                thickness: 0.5,
              ),
              Row(
                children: [
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color: AppColors.generalGrey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.coronavirus,
                      size: 25.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  Text(
                    AppStrings.autoMaticCC,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 70.w,
                  ),
                  Text(
                    widget.car.climate ? "Yes" : "No",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 90.h),
        ],
      ),
    );
  }
}
