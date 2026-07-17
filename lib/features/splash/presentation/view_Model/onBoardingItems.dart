import 'package:dalel_app/core/utils/app_assets.dart';

class onBoardingItemsModel {
  final String image;
  final String title;
  final String subtitle;

  onBoardingItemsModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

List<onBoardingItemsModel> onboading = [
  onBoardingItemsModel(
    image: Assets.assetsImagesOnBoarding,
    title: 'Explore The History with Dalel in a smart way',
    subtitle: 'Explore The History with Dalel in a smart way',
  ),
  onBoardingItemsModel(
    image: Assets.assetsImagesOnBoarding1,
    title: 'Explore The History with Dalel in a smart way',
    subtitle: 'Explore The History with Dalel in a smart way',
  ),
  onBoardingItemsModel(
    image: Assets.assetsImagesOnBoarding2,
    title: 'Explore The History with Dalel in a smart way',
    subtitle: 'Explore The History with Dalel in a smart way',
  ),
];
