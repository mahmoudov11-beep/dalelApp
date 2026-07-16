import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/features/home/presentation/view_Model/onBoardingItems.dart';
import 'package:dalel_app/features/home/presentation/views/custom_Button.dart';
import 'package:dalel_app/features/home/presentation/views/onBoarding_body.dart';
import 'package:dalel_app/features/home/presentation/widgets/onBoardingSaveData.dart';
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
                    customNavigation(context, '/signup');
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
                          text: AppStrings.signUp,
                          onPressed: () {
                            onBoardingSaveData();
                            customNavigation(context, '/signup');
                          },
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          child: Text('Sign in now'),
                          onTap: () {
                            onBoardingSaveData();
                            customNavigation(context, '/signin');
                          },
                        ),
                      ],
                    )
                  : custom_Button(
                      text: AppStrings.next,
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
