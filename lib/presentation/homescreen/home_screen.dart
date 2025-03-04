import 'package:car_rental_task/core/component/custom_text.dart';
import 'package:car_rental_task/core/constants/app_size.dart';
import 'package:car_rental_task/models/car_model_data.dart';
import 'package:car_rental_task/presentation/homescreen/homescreen_widgets/home_screen_header_card.dart';
import 'package:car_rental_task/presentation/homescreen/profilescreen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:car_rental_task/core/constants/app_string.dart';
import 'package:car_rental_task/core/theme/appcolors/app_colors.dart';
import 'chatscreen/chat_screen.dart';
import 'favoritescreen/favorite_screen.dart';
import 'homescreen_widgets/brand_cards.dart';
import 'homescreen_widgets/car_presentation_card.dart';

class HomeScreen extends StatefulWidget {
  final List<Car> filteredCars;
  const HomeScreen({super.key, required this.filteredCars});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedLocation = "Ahmedabad, INDIA";
  String? selectedBrand;
  int selectedIndex = 0;

  List<Widget> bottomNavScreens = [];

  @override
  void initState() {
    super.initState();
    bottomNavScreens = [
      HomeContent(filteredCars: widget.filteredCars),
      FavoriteScreen(),
      ChatScreen(),
      ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: IndexedStack(
        index: selectedIndex,
        children: bottomNavScreens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.white,
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.general,
        unselectedItemColor: AppColors.darkTheme,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  final List<Car> filteredCars;

  const HomeContent({super.key, required this.filteredCars});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  String selectedLocation = "Ahmedabad, INDIA";
  String? selectedBrand;
  String searchName = "";

  @override
  Widget build(BuildContext context) {
    List<Car> getFilteredCars() {
      return widget.filteredCars
          .where((car) =>
              (selectedBrand == null || car.brandName == selectedBrand) &&
              car.carName.toLowerCase().contains(searchName.toLowerCase()))
          .toList();
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.h, left: 16.w, right: 16.w),
            child: HomeScreenHeaderCard(
              searchName: searchName,
              selectedLocation: selectedLocation,
              onSearchChanged: (value) {
                setState(() {
                  searchName = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 110.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: CarBrand.carBrandList.length,
              itemBuilder: (context, index) {
                final carBrand = CarBrand.carBrandList[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedBrand = carBrand.brandName;
                    });
                  },
                  child: TrendingBrands(
                    brandName: carBrand.brandName,
                    brandImage: carBrand.brandLogo,
                    isSelected: selectedBrand == carBrand.brandName,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: AppStrings.popular,
                        fontSize: AppSize.extraLargeFont,
                        fontWeight: FontWeight.bold),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedBrand = null;
                        });
                      },
                      child: CustomText(
                          text: AppStrings.viewAll,
                          fontSize: AppSize.mediumFont,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
                  itemCount: getFilteredCars().length,
                  itemBuilder: (context, index) {
                    return PopularCars(
                      carProduct: getFilteredCars()[index],
                      favButton: () {},
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
