import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/appcolors/app_colors.dart';

class Containers extends StatelessWidget{
  final String num;
  final String name;
  final String image;

  const Containers({super.key, required this.num, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 20.h),
      child: Container(padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
        decoration: BoxDecoration(color: AppColors.general,borderRadius: BorderRadius.circular(10.r)
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(num,style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 18.sp),),
            Text(name,style: GoogleFonts.poppins(fontWeight: FontWeight.w500),),],),
          Image.asset(image,height: 70.h,width: 70.w,),
        ],),
      ),
    );
  }
}