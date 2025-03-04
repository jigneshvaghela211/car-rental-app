import 'package:car_rental_task/core/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:car_rental_task/core/theme/appcolors/app_colors.dart';
import '../../../models/favorite_screen_list.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(FontAwesomeIcons.refresh))
        ],
        backgroundColor: AppColors.general,
        title: Text(AppStrings.favorite,
            style: GoogleFonts.poppins(
                fontSize: 20.sp, fontWeight: FontWeight.bold)),
      ),
      body: Fav.favoriteCars.isEmpty
          ? Center(
              child: Text(
                AppStrings.listEmpty,
                style: GoogleFonts.poppins(
                    fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
            )
          : GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemCount: Fav.favoriteCars.length,
              itemBuilder: (context, index) {
                final car = Fav.favoriteCars[index];
                return Stack(children: [
                  SizedBox(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.w),
                      decoration: BoxDecoration(
                          color: AppColors.generalGrey,
                          border: Border.all(color: AppColors.general),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  car.carImage,
                                  height: 60.h,
                                  fit: BoxFit.fill,
                                )),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            car.carName,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "\$${car.carPrice.toInt()}",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            Fav.favoriteCars.remove(car);
                          });
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),
                ]);
              },
            ),
    );
  }
}
