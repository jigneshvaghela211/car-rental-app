import 'dart:async';
import 'package:car_rental_task/core/constants/image_strings.dart';
import 'package:car_rental_task/route/route.names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key,});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
     // Get.to(() => PageviewScreen());
      Get.toNamed(RouteNames.pageViewScreen);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Image.asset(ImageStrings.splashImage,fit: BoxFit.fill,);
  }
}
