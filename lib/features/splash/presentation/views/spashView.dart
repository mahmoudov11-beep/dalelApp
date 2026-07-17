import 'package:dalel_app/core/Serivces/service_locator.dart';
import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class splashView extends StatefulWidget {
  const splashView({super.key});

  @override
  State<splashView> createState() => _splashViewState();
}

class _splashViewState extends State<splashView> {
  @override
  void initState() {
    bool isOnboardingVisited =
        getIt<CacheHelper>().getData(key: "onBoardingVisited") ?? false;
    if (isOnboardingVisited == true) {
      FirebaseAuth.instance.currentUser == null
          ? delayedNavigator(context, '/signup')
          : delayedNavigator(context, '/signin');
    } else {
      delayedNavigator(context, '/homeview');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: custom_text_styles.pacificoStyle,
        ),
      ),
    );
  }
}
