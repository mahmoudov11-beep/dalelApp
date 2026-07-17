import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/features/splash/presentation/view_Model/onBoardingItems.dart';
import 'package:dalel_app/features/splash/presentation/views/onBoardingbody.dart';
import 'package:dalel_app/features/splash/presentation/views/custom_Button.dart';
import 'package:dalel_app/features/splash/presentation/widgets/onBoardingSaveData.dart';
import 'package:dalel_app/main.dart';
import 'package:flutter/material.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({super.key});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  PageController controller = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentGeometry.centerRight,
                child: TextButton(
                  onPressed: () {
                    customReplacementNavigation(context, '/signup');
                    onBoardingSaveData();
                  },
                  child: Text(AppStrings.skip),
                ),
              ),
              SizedBox(height: 30),
              onBoarding_body(
                controller: controller,
                onPagechanger: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
              ),
              currentIndex == onboading.length - 1
                  ? Column(
                      children: [
                        SizedBox(height: 10),
                        custom_Button(
                          color: AppColors.PrimaryColor,
                          text: AppStrings.signUp,
                          onPressed: () {
                            onBoardingSaveData();
                            customReplacementNavigation(context, '/signup');
                          },
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          child: Text('Sign in now'),
                          onTap: () {
                            onBoardingSaveData();
                            customReplacementNavigation(context, '/signin');
                          },
                        ),
                      ],
                    )
                  : custom_Button(
                      text: AppStrings.next,
                      color: AppColors.PrimaryColor,
                      onPressed: () {
                        controller.nextPage(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.bounceIn,
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
