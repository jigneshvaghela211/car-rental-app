import 'package:car_rental_task/core/constants/app_string.dart';
import 'package:car_rental_task/core/constants/image_strings.dart';

class Car {
  final String carName;
  final String brandName;
  final String brandImage;
  final String carImage;
  final double carPrice;
  final String characteristics;
  final double carRate;
  final double engine;
  final double carQuantity;
  final String carTypes;
  final String fuelType;
  final String description;
  final bool bluetooth;
  final bool climate;

  Car({
    required this.carName,
    required this.brandName,
    required this.brandImage,
    required this.carImage,
    required this.carPrice,
    required this.characteristics,
    required this.carRate,
    required this.engine,
    required this.carQuantity,
    required this.carTypes,
    required this.fuelType,
    required this.description,
    required this.bluetooth,
    required this.climate,
  });
}

class CarBrand {
  final String brandName;
  final String brandLogo;

  CarBrand({required this.brandName, required this.brandLogo});

  static List<CarBrand> carBrandList = [
    CarBrand(brandName: AppStrings.mercedesName, brandLogo: ImageStrings.mercedesLogo),
    CarBrand(brandName: AppStrings.ferrariName, brandLogo: ImageStrings.ferrariLogo),
    CarBrand(brandName: AppStrings.bugattiName, brandLogo: ImageStrings.bugattiLogo),
    CarBrand(brandName: AppStrings.bmwName, brandLogo: ImageStrings.bmwLogo),
    CarBrand(brandName: AppStrings.teslaName, brandLogo: ImageStrings.teslaLogo),
    CarBrand(brandName: AppStrings.lamborghiniName, brandLogo: ImageStrings.lamborghiniLogo),
  ];
}
