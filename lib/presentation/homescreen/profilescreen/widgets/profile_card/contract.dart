import 'package:car_rental_task/core/constants/image_strings.dart';
import 'package:car_rental_task/core/theme/appcolors/app_colors.dart';
import 'package:flutter/material.dart';

class Contract extends StatelessWidget {
  const Contract({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.white,
        body: Center(child: Image.asset(ImageStrings.contract))
    );
  }
}
