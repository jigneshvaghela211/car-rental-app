import 'package:car_rental_task/core/component/custom_text.dart';
import 'package:car_rental_task/route/route.names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_string.dart';
import '../../../../core/constants/image_strings.dart';
import '../../../../core/theme/appcolors/app_colors.dart';
import '../ineterest/interest_screen.dart';
import '../login/widgets/button.widgets/facebook.button.dart';
import '../login/widgets/button.widgets/google.button.dart';
import '../../../../core/component/round_button.dart';
import 'widgets/customtextformfields/custom_text_form_fields.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        toolbarHeight: 5.h,
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
                CustomTextFormField(
                  nameController: nameController,
                  emailController: emailController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                ),
                CustomText(text: AppStrings.forgotPass, fontSize: AppSize.mediumFont,fontWeight: FontWeight.w400,color: AppColors.general,),
                RoundButton(title: AppStrings.signUp,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                     Get.to(() => InterestScreen(),
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
                    CustomText(text: AppStrings.option, fontSize: AppSize.mediumFont, fontWeight: FontWeight.w400,color: Colors.grey,),
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
                ),

                Padding(
                  padding: EdgeInsets.only(top: 50.h,bottom: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: AppStrings.bottomAc, fontSize: AppSize.mediumFont, fontWeight: FontWeight.w400),
                      GestureDetector(onTap: (){
                        Get.toNamed(RouteNames.loginScreen);
                      },
                          child: CustomText(text: AppStrings.login, fontSize: AppSize.mediumFont, fontWeight: FontWeight.w400,color: AppColors.general,)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
