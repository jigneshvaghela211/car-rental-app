import 'package:car_rental_task/core/constants/app_string.dart';
import 'package:car_rental_task/core/constants/image_strings.dart';

class AddressScreenModelData {
  final String image;
  final String title;
  final String subTitle;

  AddressScreenModelData({
    required this.image,
    required this.title,
    required this.subTitle,
  });

  static List<AddressScreenModelData> locationList = [
    AddressScreenModelData(
      image: ImageStrings.homeMap,
      title: AppStrings.homeTitle,
      subTitle: AppStrings.homeSubTitle,
    ),
    AddressScreenModelData(
      image: ImageStrings.workMap,
      title: AppStrings.workTitle,
      subTitle: AppStrings.workSubTitle,
    ),
    AddressScreenModelData(
      image: ImageStrings.officeMap,
      title: AppStrings.officeTitle,
      subTitle: AppStrings.officeSubTitle,
    ),
  ];
}
