import 'package:car_rental_task/core/component/custom_text.dart';
import 'package:car_rental_task/core/constants/app_size.dart';
import 'package:car_rental_task/core/constants/app_string.dart';
import 'package:car_rental_task/core/constants/image_strings.dart';
import 'package:car_rental_task/core/theme/appcolors/app_colors.dart';
import 'package:car_rental_task/presentation/screens/auth/login/widgets/button.widgets/facebook.button.dart';
import 'package:car_rental_task/presentation/screens/auth/login/widgets/button.widgets/google.button.dart';
import 'package:car_rental_task/presentation/screens/auth/login/widgets/customtextfields/custom_text_fields.dart';
import 'package:car_rental_task/presentation/screens/auth/signup/signup_screen.dart';
import 'package:car_rental_task/presentation/screens/on_boarding/ineterest/interest_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        toolbarHeight: 5,
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset(ImageStrings.carZImage),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: AppStrings.headerTitle,
                        fontSize: AppSize.doubleELFont,
                        fontWeight: FontWeight.bold),
                    CustomText(text: '👋', fontSize: AppSize.doubleELFont, fontWeight: FontWeight.bold),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: AppStrings.headerTitleR,
                        fontSize: AppSize.doubleELFont,
                        fontWeight: FontWeight.bold),
                    CustomText(color: AppColors.general,
                        text: AppStrings.carZ,
                        fontSize: AppSize.doubleELFont,
                        fontWeight: FontWeight.bold)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25.w,top: 5.h),
                  child: CustomText(color: Colors.grey,
                      text: AppStrings.screenSubtitle,
                      fontSize: AppSize.mediumFont,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 20.h),
                CustomTextFields(
                    emailController: emailController,
                    passwordController: passwordController),
                CustomText(color: AppColors.general,
                    text: AppStrings.forgotPass,
                    fontSize: AppSize.mediumFont,
                    fontWeight: FontWeight.w400),
                RoundButton(
                  title: AppStrings.login,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InterestScreen()),
                      );
                    }
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.generalGrey,
                      ),
                    ),
                    CustomText(color: Colors.grey,
                        text: AppStrings.option,
                        fontSize: AppSize.mediumFont,
                        fontWeight: FontWeight.w400),
                    Expanded(
                      child: Divider(
                        color: AppColors.generalGrey,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GoogleButton(),
                      FaceBookButton(),
                    ],
                  ),
                ),SizedBox(height: 50.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: AppStrings.bottomText,
                        fontSize: AppSize.mediumFont,
                        fontWeight: FontWeight.w400),
                    GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupScreen()));},
                      child: CustomText(color: AppColors.general,
                          text: AppStrings.bottomRich,
                          fontSize: AppSize.mediumFont,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
