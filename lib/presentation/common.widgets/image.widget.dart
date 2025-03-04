import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_size.dart';
import '../homescreen/profilescreen/profile_screen.dart';

class WaveImage extends StatelessWidget{
  final String wave;

  const WaveImage({super.key, required this.wave});

  @override
  Widget build(BuildContext context) {
    return  Image.asset(
      wave,
      height: 30.h,
    );
  }
}

class HomeScreenProfile extends StatelessWidget{
  final String profile;

  const HomeScreenProfile({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      },
      child: Image.asset(
        profile,
        height: 50.h,
        width: 50.w,
      ),
    );
  }
}

class HomeMenuImage extends StatelessWidget{
  final String menu;

  const HomeMenuImage({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40.h,
        width: 45.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 0.5.r,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.r),
          child: Image.asset(
            menu,
            height: 40.h,
            width: 50.w,
          ),
        ),
      ),
    );
  }
}