import 'package:car_rental_task/core/component/round_button.dart';
import 'package:car_rental_task/core/constants/app_string.dart';
import 'package:car_rental_task/core/theme/appcolors/app_colors.dart';
import 'package:car_rental_task/data/address_model_data/address_screen_model_data.dart';
import 'package:car_rental_task/presentation/productscreen/widget/product_screen_body.dart';
import 'package:car_rental_task/route/route.names.dart';
import 'package:flutter/material.dart';
import 'package:car_rental_task/models/car_model_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ProductScreen extends StatefulWidget {
  final Car carProduct;

  const ProductScreen({super.key, required this.carProduct});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int selectedCarIndex = -1;
  DateTime selectedDate = DateTime.now();
  String selectedTime = "07:00 AM";
  bool showDatePicker = false;

  void _onDateSelected(DateTime date) {
    setState(() {
      selectedDate = date;
      showDatePicker = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back
        ),
        title: Text(
          widget.carProduct.carName,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Stack(
          children: [
            ProductScreenBody(car: widget.carProduct),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppStrings.totalPrice,
                              style: GoogleFonts.poppins(color: Colors.grey)),
                          Text(
                            "\$${widget.carProduct.carPrice}",
                            style: GoogleFonts.poppins(
                                color: AppColors.general,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {

                          double carPrice = widget.carProduct.carPrice ?? 0.0;

                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: AppColors.white,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setSheetState) {
                                  return SingleChildScrollView(
                                    child: Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
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
                                          SizedBox(height: 15.h),

                                          Text(
                                            AppStrings.selectDate,
                                            style: GoogleFonts.poppins(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10.h),

                                          if (!showDatePicker) ...[
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  DateFormat.yMMMMd().format(selectedDate),
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () => setSheetState(() => showDatePicker = true),
                                                  child: Container(
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.generalGrey,
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    child: Icon(Icons.calendar_month_outlined),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              DateFormat.EEEE().format(selectedDate),
                                              style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.grey),
                                            ),
                                            SizedBox(height: 16.h),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: List.generate(35, (index) {
                                                  DateTime date = DateTime.now().add(Duration(days: index - 2));
                                                  return GestureDetector(
                                                    onTap: () => setSheetState(() => selectedDate = date),
                                                    child: Container(
                                                      width: 70.w,
                                                      margin: EdgeInsets.only(right: 10.w),
                                                      padding: EdgeInsets.all(8.r),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(8.r),
                                                        border: Border.all(
                                                          color: selectedDate.day == date.day
                                                              ? AppColors.general
                                                              : AppColors.generalGrey,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            DateFormat.d().format(date),
                                                            style: GoogleFonts.poppins(
                                                              fontSize: 20.sp,
                                                              fontWeight: FontWeight.bold,
                                                              color: selectedDate.day == date.day
                                                                  ? AppColors.general
                                                                  : AppColors.darkTheme,
                                                            ),
                                                          ),
                                                          Text(
                                                            DateFormat.E().format(date),
                                                            style: GoogleFonts.poppins(
                                                              fontSize: 12.sp,
                                                              color: selectedDate.day == date.day
                                                                  ? AppColors.general
                                                                  : AppColors.darkTheme,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ),
                                          ] else ...[
                                            SfDateRangePicker(
                                              backgroundColor: AppColors.white,
                                              headerStyle: DateRangePickerHeaderStyle(
                                                backgroundColor: AppColors.white,
                                                textStyle: GoogleFonts.poppins(),
                                              ),
                                              monthCellStyle: DateRangePickerMonthCellStyle(
                                                textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                                              ),
                                              selectionMode: DateRangePickerSelectionMode.single,
                                              selectionColor: AppColors.general,
                                              initialSelectedDate: selectedDate,
                                              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                                                if (args.value is DateTime) {
                                                  _onDateSelected(args.value);
                                                  setSheetState(() {
                                                    showDatePicker = false;
                                                  });
                                                }
                                              },
                                            ),
                                          ],

                                          SizedBox(height: 20.h),

                                          Text(
                                            AppStrings.selectTime,
                                            style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 15.h),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                AppStrings.firstTime,
                                                AppStrings.secondTime,
                                                AppStrings.thirdTime,
                                                AppStrings.fourthTime
                                              ].map(
                                                    (time) => GestureDetector(
                                                  onTap: () => setSheetState(() => selectedTime = time),
                                                  child: Container(
                                                    margin: EdgeInsets.only(right: 10.w),
                                                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                        color: selectedTime == time ? AppColors.general : AppColors.generalGrey,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8.r),
                                                    ),
                                                    child: Text(
                                                      time,
                                                      style: GoogleFonts.poppins(
                                                        fontSize: 14.sp,
                                                        color: selectedTime == time ? AppColors.general : AppColors.darkTheme,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ).toList(),
                                            ),
                                          ),
                                          SizedBox(height: 16.h),
                                          RoundButton(
                                            onPressed: () {
                                              Get.toNamed(RouteNames.addressScreen,arguments: AddressScreenModelData.locationList.first);
                                            },
                                            title: AppStrings.confirm,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 55.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.general,
                          ),
                          child: Center(
                            child: Text(
                              AppStrings.bookNow,
                              style: GoogleFonts.poppins(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkTheme,
                              ),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
