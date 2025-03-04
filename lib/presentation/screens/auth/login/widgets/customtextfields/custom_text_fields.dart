import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../core/constants/app_string.dart';
import '../../../../../../core/theme/appcolors/app_colors.dart';

class CustomTextFields extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const CustomTextFields({super.key, required this.emailController, required this.passwordController});

  @override
  State<CustomTextFields> createState() => _CustomTextFieldsState();
}

class _CustomTextFieldsState extends State<CustomTextFields> {
  bool _isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // Email Field
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: TextFormField(
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(filled: true,fillColor: AppColors.generalGrey,
              hintText: AppStrings.hintText,
              hintStyle: GoogleFonts.poppins(color: AppColors.subTitle),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? "Password cannot be empty"
                  : !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)
              ? "Enter valid email"
              : null;
            },
          ),
        ),

        // Password Field
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
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
              return (value == null || value.isEmpty)
                  ? "Password cannot be empty"
                  : (value.length < 6)
                  ? "Password must be at least 6 characters"
                  : null;
            }
    ),
        ),
    ]);
  }
}
