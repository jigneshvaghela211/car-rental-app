import 'package:car_rental_task/core/constants/app_size.dart';
import 'package:car_rental_task/core/utils/function_component.dart';
import 'package:car_rental_task/models/car_model_data.dart';
import 'package:car_rental_task/models/favorite_screen_list.dart';
import 'package:car_rental_task/presentation/productscreen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:car_rental_task/core/theme/appcolors/app_colors.dart';

class PopularCars extends StatefulWidget {
  final Car carProduct;
  final VoidCallback favButton;

  const PopularCars(
      {super.key, required this.carProduct, required this.favButton});

  @override
  State<PopularCars> createState() => _PopularCarsState();
}

class _PopularCarsState extends State<PopularCars> {
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    isLiked = Fav.favoriteCars.contains(widget.carProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductScreen(carProduct: widget.carProduct),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 290.h,
            margin: EdgeInsets.symmetric(vertical: 10.h),
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: AppColors.iconsColor, blurRadius: 5.r)
              ],
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 40.r,
                    width: 40.r,
                    decoration: BoxDecoration(
                      color: AppColors.generalGrey,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (isLiked) {
                            Fav.favoriteCars.remove(widget.carProduct);
                          } else {
                            Fav.favoriteCars.add(widget.carProduct);
                            showSnackBar(context,
                                '${widget.carProduct.carName} - added');
                          }
                          isLiked = !isLiked;
                        });
                      },
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.redAccent : AppColors.favorite,
                        size: 25.sp,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Image.asset(
                    widget.carProduct.carImage,
                    height: 130.h,
                    width: 300.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.carProduct.carName,
                        style: GoogleFonts.poppins(
                          color: AppColors.darkTheme,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(' ⭐ ', style: TextStyle(fontSize: 14.sp)),
                          Text(
                            widget.carProduct.carRate.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(height: 30.h, endIndent: 1.w),
                Row(
                  children: [
                    Icon(Icons.offline_bolt_outlined,
                        color: AppColors.iconsColor, size: 20.sp),
                    Text(
                      "${widget.carProduct.engine} hp",
                      style: GoogleFonts.poppins(
                          color: AppColors.iconsColor, fontSize: 14.sp),
                    ),
                    SizedBox(width: 20.w),
                    Icon(Icons.display_settings,
                        color: AppColors.iconsColor, size: 20.sp),
                    Text(
                      widget.carProduct.characteristics,
                      style: GoogleFonts.poppins(
                          color: AppColors.iconsColor, fontSize: 14.sp),
                    ),
                    Spacer(),
                    Text(
                      "\$${widget.carProduct.carPrice.toInt()}",
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkTheme,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
