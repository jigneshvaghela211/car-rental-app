import 'package:car_rental_task/core/theme/appcolors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: AppColors.generalGrey,
              borderRadius: BorderRadius.circular(10.r)),
          child: Icon(icon, size: 24.sp)),
      title: Text(
        title,
        style:
            GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
      onTap: () {},
    );
  }
}
