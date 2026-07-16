
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class custom_text_styles {
  static final pacificoStyle = TextStyle(
    fontSize: 32,
    color: AppColors.deepBrown,
    fontFamily: 'Pacifico',
  );
  static final PoppinsStyleBold = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
    fontFamily: 'Poppins',
  );
  static final PoppinsStyleLight = TextStyle(
    fontSize: 18,
    color: AppColors.black,
    fontWeight: FontWeight.w100,
    fontFamily: 'Poppins',
  );
}

