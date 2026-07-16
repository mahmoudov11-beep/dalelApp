import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/home/presentation/view_Model/onBoardingItems.dart';
import 'package:dalel_app/features/home/presentation/widgets/SmoothPageIndicatorWidget.dart';
import 'package:flutter/material.dart';

class onBoarding_widget extends StatelessWidget {
  const onBoarding_widget({super.key, required this.controller , this.onPageChanged});

  final PageController controller;
  final Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: onPageChanged,
      controller: controller,
      itemCount: onboading.length,
      itemBuilder: (context, index) {
        return ListView(
          children: [
            Container(
              height: 290,
              width: 343,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(onboading[index].image),
                ),
              ),
            ),
            SizedBox(height: 40),
            SmoothPageIndicatorWidget(controller: controller),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
              child: Text(
                onboading[index].title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: custom_text_styles.PoppinsStyleBold.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 40),
              child: Text(
                onboading[index].subtitle,
                style: custom_text_styles.PoppinsStyleLight,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40),
          ],
        );
      },
    );
  }
}
