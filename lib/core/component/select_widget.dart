import 'package:car_rental_task/data/car_data_manager/car_data_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:car_rental_task/core/theme/appcolors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectWidget extends StatefulWidget {
  final String selectedType;
  final String carTypes;

  const SelectWidget({super.key, required this.carTypes, required this.selectedType});

  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          CarDataManager.cars.length;
        });
      },
      child: IntrinsicWidth(
        child: IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                  color: isSelected == true? AppColors.general : AppColors.generalGrey),
              color: AppColors.white
            ),
            alignment: Alignment.center,
            child: FittedBox(
              child: Text(
                widget.carTypes,
                style: GoogleFonts.poppins(fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isSelected == true? AppColors.general : AppColors.darkTheme,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
