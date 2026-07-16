import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class custom_Button extends StatelessWidget {
  const custom_Button({
    super.key,
    this.color,
    this.width,
    required this.text,
    this.onPressed,
  });
  final Color? color;
  final double? width;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.PrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: custom_text_styles.PoppinsStyleLight),
      ),
    );
  }
}
