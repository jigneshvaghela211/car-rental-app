import 'package:car_rental_task/presentation/address_screen/address_screen.dart';
import 'package:car_rental_task/presentation/homescreen/chatscreen/chat_screen.dart';
import 'package:car_rental_task/presentation/homescreen/favoritescreen/favorite_screen.dart';
import 'package:car_rental_task/presentation/homescreen/filteredcarsscreen/filteredcars_screen.dart';
import 'package:car_rental_task/presentation/homescreen/home_screen.dart';
import 'package:car_rental_task/presentation/homescreen/profilescreen/profile_screen.dart';
import 'package:car_rental_task/presentation/homescreen/profilescreen/widgets/edit_profile_screen.dart';
import 'package:car_rental_task/presentation/homescreen/profilescreen/widgets/profile_card/contract.dart';
import 'package:car_rental_task/presentation/homescreen/profilescreen/widgets/profile_card/license.dart';
import 'package:car_rental_task/presentation/homescreen/profilescreen/widgets/profile_card/passport.dart';
import 'package:car_rental_task/presentation/homescreen/searchscreen/search_screen.dart';
import 'package:car_rental_task/presentation/payment_method_screen/payment_method_screen.dart';
import 'package:car_rental_task/presentation/productscreen/product_screen.dart';
import 'package:car_rental_task/presentation/screens/auth/login/login_screen.dart';
import 'package:car_rental_task/presentation/screens/auth/login/widgets/facebook/facebook_screen.dart';
import 'package:car_rental_task/presentation/screens/auth/login/widgets/google/google_screen.dart';
import 'package:car_rental_task/presentation/screens/auth/signup/signup_screen.dart';
import 'package:car_rental_task/presentation/screens/on_boarding/on_boarding_screen.dart';
import 'package:car_rental_task/presentation/screens/splashscreen/splash_screen.dart';
import 'package:car_rental_task/route/route.names.dart';
import 'package:get/get.dart';

import '../presentation/screens/auth/ineterest/interest_screen.dart';

class Routes {

  static final List<GetPage<dynamic>> pages = [
    GetPage(name: RouteNames.splashScreen, page:()=>SplashScreen()),
    GetPage(name: RouteNames.pageViewScreen, page:()=>PageviewScreen()),
    GetPage(name: RouteNames.loginScreen, page:()=>LoginScreen()),
    GetPage(name: RouteNames.faceBookScreen, page:()=>FacebookScreen()),
    GetPage(name: RouteNames.googleScreen, page:()=>GoogleScreen()),
    GetPage(name: RouteNames.signUpScreen, page:()=>SignupScreen()),
    GetPage(name: RouteNames.interestScreen, page:()=>InterestScreen()),
    GetPage(name: RouteNames.homeScreen, page:()=>HomeScreen(filteredCars:  Get.arguments)),
    GetPage(name: RouteNames.searchScreen, page:()=>SearchScreen(forSearch:  Get.arguments)),
    GetPage(name: RouteNames.filterCarsScreen, page:()=>FilteredCarsScreen(filtredCars: Get.arguments)),
    GetPage(name: RouteNames.favoriteScreen, page:()=>FavoriteScreen()),
    GetPage(name: RouteNames.chatScreen, page:()=>ChatScreen()),
    GetPage(name: RouteNames.profileScreen, page:()=>ProfileScreen()),
    GetPage(name: RouteNames.license, page:()=>License()),
    GetPage(name: RouteNames.passport, page:()=>Passport()),
    GetPage(name: RouteNames.contract, page:()=>Contract()),
    GetPage(name: RouteNames.editProfileScreen, page:()=>EditProfileScreen(name:  Get.arguments, image:  Get.arguments)),
    GetPage(name: RouteNames.productScreen, page:()=>ProductScreen(carProduct: Get.arguments),),
    GetPage(name: RouteNames.addressScreen, page:()=>AddressScreen(carProduct:  Get.arguments,address:  Get.arguments,)),
    GetPage(name: RouteNames.paymentMethodScreen, page:()=>PaymentMethodScreen(carProduct:  Get.arguments)),
  ];

}
