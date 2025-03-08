import '../../core/constants/app_string.dart';
import '../../core/constants/image_strings.dart';

class OnBoardingModel {
  final String image;

  OnBoardingModel({required this.image});
}

// Image data list
List<OnBoardingModel> onboardingData = [
  OnBoardingModel(image: ImageStrings.onBoarding),
  OnBoardingModel(image: ImageStrings.onBoardingThree),
  OnBoardingModel(image: ImageStrings.onBoardingFour),
];

class OnBoardingTextModel {
  final String title;
  final String subtitle;

  OnBoardingTextModel({required this.title, required this.subtitle});
}

// OnBoarding text list
List<OnBoardingTextModel> onboardingTexts = [
  OnBoardingTextModel(
    title: AppStrings.onBoardingHeader,
    subtitle: AppStrings.onBoardingSubtitle,
  ),
  OnBoardingTextModel(
    title: AppStrings.onBoardingHeaderTwo,
    subtitle: AppStrings.onBoardingSubtitleTwo,
  ),
  OnBoardingTextModel(
    title: AppStrings.onBoardingHeaderThree,
    subtitle: AppStrings.onBoardingSubtitle,
  ),
];
