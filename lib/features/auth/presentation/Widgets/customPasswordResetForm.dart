import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/functions/toast_function.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/features/auth/presentation/Widgets/customTextField.dart';
import 'package:dalel_app/features/auth/presentation/Widgets/forgetPasswordWidget.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel_app/features/splash/presentation/views/custom_Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class passwordResetForm extends StatelessWidget {
  const passwordResetForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<authCubit, SigningState>(
      listener: (context, state) {
        if (state is errorPassResetState) {
          toaster(state.errMessage);
        }
        if (state is SuccessfulPassResetState) {
          toaster('Reset Link successfully Sent');
          customReplacementNavigation(context, '/signin');
        }
      },
      builder: (context, state) {
        authCubit auth = BlocProvider.of<authCubit>(context);
        return Form(
          key: auth.ResetPasswordkey,
          child: Column(
            children: [
              SizedBox(height: 150),
              customTextFormField(
                text: 'Email',
                onChanged: (email) {
                  auth.email = email;
                },
              ),

              SizedBox(height: 60),

              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                child: state is loadingPassResetState
                    ? CircularProgressIndicator(color: AppColors.PrimaryColor)
                    : custom_Button(
                        onPressed: () async {
                          if (auth.ResetPasswordkey.currentState!.validate()) {
                            await auth.resetPassword();
                          }
                        },
                        text: 'Send Password Reset Link',
                        color: AppColors.PrimaryColor,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
