// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:car_rental_task/core/constants/image_strings.dart';
import 'package:car_rental_task/presentation/screens/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key,});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PageviewScreen()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Image.asset(ImageStrings.splashImage,fit: BoxFit.fill,);
  }
}
