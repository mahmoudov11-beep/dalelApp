import 'dart:ui';

import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class welcomeTextWidget extends StatelessWidget {
  const welcomeTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: custom_text_styles.PoppinsStyle400Size28,
    );
  }
}
