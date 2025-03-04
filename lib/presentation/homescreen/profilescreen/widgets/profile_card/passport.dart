import 'package:car_rental_task/core/constants/image_strings.dart';
import 'package:flutter/material.dart';

class Passport extends StatelessWidget {
  const Passport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Center(child: Image.asset(ImageStrings.passport)),
    );
  }
}
