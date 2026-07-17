import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class custom_text_styles {
  static final pacificoStyle = TextStyle(
    fontSize: 32,
    color: AppColors.deepBrown,
    fontFamily: 'Pacifico',
  );
  static final pacificoStyleBoldSize42 = TextStyle(
    fontSize: 42,
    color: AppColors.deepBrown,
    fontWeight: FontWeight.bold,
    fontFamily: 'Pacifico',
  );
  static final PoppinsStyleBoldSize28 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
    fontFamily: 'Poppins',
  );
  static final PoppinsStyle300Size18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: AppColors.black,
    fontFamily: 'Poppins',
  );
  static final PoppinsStyle400Size28 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontFamily: 'Poppins',
  );
  static final PoppinsStyleLightSize18 = TextStyle(
    fontSize: 18,
    color: AppColors.black,
    fontWeight: FontWeight.w100,
    fontFamily: 'Poppins',
  );
}
