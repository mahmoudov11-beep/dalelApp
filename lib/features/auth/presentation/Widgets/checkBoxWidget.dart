import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/features/auth/presentation/Widgets/conditionAndTerms.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class checkBoxWidget extends StatefulWidget {
  checkBoxWidget({super.key});

  @override
  State<checkBoxWidget> createState() => _checkBoxWidgetState();
}

class _checkBoxWidgetState extends State<checkBoxWidget> {
  bool? value = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(4),
          ),
          side: BorderSide(color: AppColors.deepGrey),
          value: value,
          onChanged: (newvalue) {
            setState(() {
              value = newvalue;
              BlocProvider.of<authCubit>(
                context,
              ).checkBoxWidgetCubit(newValue: newvalue);
            });
          },
        ),
        conditionAndTerms(),
      ],
    );
  }
}
