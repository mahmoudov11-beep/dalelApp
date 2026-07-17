import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class customTextFormField extends StatelessWidget {
  customTextFormField({
    super.key,
    required this.text,
    this.onChanged,
    this.onFieldSubmitted,
    this.obsecure = false,
    this.suffixIcon,
  });
  final String text;
  Function(String)? onChanged;
  Function(String)? onFieldSubmitted;
  Widget? suffixIcon;
  final bool obsecure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 14),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'the field is empty';
          } else {
            return null;
          }
        },
        obscureText: obsecure,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          label: Text(text),
          focusedBorder: outlineInput_Border(),
          enabledBorder: outlineInput_Border(),
          suffixIcon: suffixIcon,
          labelStyle: custom_text_styles.PoppinsStyleLightSize18,
        ),
      ),
    );
  }
}

OutlineInputBorder outlineInput_Border() {
  return OutlineInputBorder(borderSide: BorderSide(color: AppColors.grey));
}
