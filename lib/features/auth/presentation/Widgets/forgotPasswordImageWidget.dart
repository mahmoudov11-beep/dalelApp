import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class forgotPasswordImageWidget extends StatelessWidget {
  const forgotPasswordImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235,
      child: Image.asset(Assets.assetsImagesForgotPassword),
    );
  }
}
