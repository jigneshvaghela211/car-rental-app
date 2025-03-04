import 'dart:io';
import 'package:car_rental_task/core/component/round_button.dart';
import 'package:car_rental_task/core/constants/image_strings.dart';
import 'package:car_rental_task/presentation/homescreen/profilescreen/widgets/edit_profile_screen.dart';
import 'package:car_rental_task/presentation/homescreen/profilescreen/widgets/profile_card/contract.dart';
import 'package:car_rental_task/presentation/homescreen/profilescreen/widgets/profile_card/license.dart';
import 'package:car_rental_task/presentation/homescreen/profilescreen/widgets/profile_card/passport.dart';
import 'package:car_rental_task/presentation/homescreen/profilescreen/widgets/profile_card/profile_card.dart';
import 'package:car_rental_task/presentation/homescreen/profilescreen/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/component/custom_app_bar.dart';
import '../../../core/constants/app_string.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = AppStrings.mainName;
  String userImage = ImageStrings.me;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: AppStrings.myProfile),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: userImage.contains(ImageStrings.me)
                          ? Image.asset(
                              userImage,
                              height: 90.h,
                              width: 90.w,
                            )
                          : Image.file(File(userImage),
                              height: 90.h, width: 90.w, fit: BoxFit.fill),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      userName,
                      style: GoogleFonts.poppins(
                          fontSize: 22.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                RoundButton(
                  onPressed: () async {
                    final updatedData = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfileScreen(
                              name: userName, image: userImage)),
                    );
                    if (updatedData != null) {
                      setState(() {
                        userName = updatedData["name"];
                        userImage = updatedData["imagePath"];
                      });
                    }
                  },
                  title: AppStrings.editProfile,
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => License()));
                      },
                      child: ProfileCard(
                          icon: FontAwesomeIcons.idCard,
                          title: AppStrings.license),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Passport()));
                      },
                      child: ProfileCard(
                          icon: FontAwesomeIcons.passport,
                          title: AppStrings.passPort),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Contract()));
                      },
                      child: ProfileCard(
                          icon: FontAwesomeIcons.fileContract,
                          title: AppStrings.contract),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                ProfileItem(icon: Icons.person, title: AppStrings.myProfile),
                ProfileItem(
                    icon: FontAwesomeIcons.calendarDays,
                    title: AppStrings.myBookings),
                ProfileItem(icon: Icons.settings, title: AppStrings.setting),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
