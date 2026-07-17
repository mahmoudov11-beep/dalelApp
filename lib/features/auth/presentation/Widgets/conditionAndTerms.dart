import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class conditionAndTerms extends StatelessWidget {
  const conditionAndTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: AppStrings.iHaveAgreeToOur),
          TextSpan(
            text: AppStrings.termsAndCondition,
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }
}
