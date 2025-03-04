import 'package:car_rental_task/core/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_size.dart';
import '../../../../../../core/theme/appcolors/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const CustomTextFormField({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // Name Field
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.w),
          child: TextFormField(
            controller: widget.nameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(fillColor: AppColors.generalGrey,filled: true,
              hintText: AppStrings.name,
              hintStyle: GoogleFonts.poppins(color: AppColors.subTitle),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Name cannot be empty";
              }
              return null;
            },
          ),
        ),

        // Email Field
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.w),
          child: TextFormField(
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(fillColor: AppColors.generalGrey,filled: true,
              hintText: AppStrings.hintText,
              hintStyle: GoogleFonts.poppins(color: AppColors.subTitle),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email cannot be empty";
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return "Enter a valid email";
              }
              return null;
            },
          ),
        ),

        // Password Field
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.w),
          child: TextFormField(
            controller: widget.passwordController,
            keyboardType: TextInputType.number,
            obscureText: _isObscurePassword,
            decoration: InputDecoration(fillColor: AppColors.generalGrey,filled: true,
              hintText: AppStrings.hintPassword,
              hintStyle: GoogleFonts.poppins(color: AppColors.subTitle),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.subTitle,
                ),
                onPressed: () {
                  setState(() {
                    _isObscurePassword = !_isObscurePassword;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password cannot be empty";
              }
              if (value.length < 6) {
                return "Password must be at least 6 characters";
              }
              return null;
            },
          ),
        ),

        // Confirm Password Field
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.w),
          child: TextFormField(
            controller: widget.confirmPasswordController,
            keyboardType: TextInputType.number,
            obscureText: _isObscureConfirmPassword,
            decoration: InputDecoration(fillColor: AppColors.generalGrey,filled: true,
              hintText: AppStrings.conformPassword,
              hintStyle: GoogleFonts.poppins(color: AppColors.subTitle),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.subTitle,
                ),
                onPressed: () {
                  setState(() {
                    _isObscureConfirmPassword = !_isObscureConfirmPassword;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Confirm Password cannot be empty";
              }
              if (value != widget.passwordController.text) {
                return "Passwords do not match";
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
