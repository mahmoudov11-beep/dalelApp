import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothPageIndicatorWidget extends StatelessWidget {
  const SmoothPageIndicatorWidget({super.key, required this._controller});
  final PageController _controller;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SmoothPageIndicator(
        controller: _controller,
        count: 3,
        effect: const WormEffect(
          dotHeight: 8,
          dotWidth: 15,
          activeDotColor: AppColors.deepBrown,
          dotColor: AppColors.PrimaryColor,
          type: WormType.thinUnderground,
        ),
      ),
    );
  }
}
