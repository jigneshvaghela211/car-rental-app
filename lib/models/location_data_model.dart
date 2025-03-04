import 'package:car_rental_task/core/constants/app_string.dart';

class LocationDataModel {
  final String searchLocation;
  final String coffee;
  final String cinema;
  final String places;
  final String favorite;
  final String home;
  final String office;
  final String yogaCentre;
  final String addressHome;
  final String addressOffice;
  final String addressYC;
  final double coffeeCount;
  final double cinemaCount;
  final double homeDistance;
  final double officeDistance;
  final double yCDistance;

  LocationDataModel({
    required this.searchLocation,
    required this.coffee,
    required this.cinema,
    required this.places,
    required this.favorite,
    required this.home,
    required this.office,
    required this.yogaCentre,
    required this.addressHome,
    required this.addressOffice,
    required this.addressYC,
    required this.coffeeCount,
    required this.cinemaCount,
    required this.homeDistance,
    required this.officeDistance,
    required this.yCDistance,
  });

  static final List<LocationDataModel> locationDataProvider = [
    LocationDataModel(
      searchLocation: AppStrings.searchLocation,
      coffee: AppStrings.coffee,
      cinema: AppStrings.cinema,
      places: AppStrings.places,
      favorite: AppStrings.favorite,
      home: AppStrings.home,
      office: AppStrings.office,
      yogaCentre: AppStrings.yogaCentre,
      addressHome: AppStrings.addressHome,
      addressOffice: AppStrings.addressOffice,
      addressYC: AppStrings.addressYC,
      coffeeCount: 150,
      cinemaCount: 8,
      homeDistance: 5.1,
      officeDistance: 2.5,
      yCDistance: 1.0,
    ),
  ];
}
class LocationSearch {
  final String location;
  final String locationDetails;
  final double locationDistance;

  LocationSearch({
    required this.location,
    required this.locationDetails,
    required this.locationDistance,
  });

  static List<LocationSearch> getLocations() {
    return [
      LocationSearch(location: AppStrings.home, locationDetails: AppStrings.addressHome, locationDistance: 5.1),
      LocationSearch(location: AppStrings.office, locationDetails: AppStrings.addressOffice, locationDistance: 2.5),
      LocationSearch(location: AppStrings.yogaCentre, locationDetails: AppStrings.addressYC, locationDistance: 1.0),
      LocationSearch(location: AppStrings.gym, locationDetails: AppStrings.addressGym, locationDistance: 3.5),
      LocationSearch(location: AppStrings.temple, locationDetails: AppStrings.addressTemple, locationDistance: 4.1),
      LocationSearch(location: AppStrings.hotel, locationDetails: AppStrings.addressHotel, locationDistance: 6.3),
      LocationSearch(location: AppStrings.crossRoad, locationDetails: AppStrings.addressCrossRoad, locationDistance: 7.2),
      LocationSearch(location: AppStrings.templeTwo, locationDetails: AppStrings.addressTempleTwo, locationDistance: 5.7),
      LocationSearch(location: AppStrings.viratNagar, locationDetails: AppStrings.addressVirat, locationDistance: 4.9),
      LocationSearch(location: AppStrings.amd, locationDetails: AppStrings.addressAmd, locationDistance: 50),
    ];
  }
}

