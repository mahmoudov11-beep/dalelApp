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

class customSigninForm extends StatelessWidget {
  const customSigninForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => authCubit(),
      child: BlocConsumer<authCubit, SigningState>(
        listener: (context, state) {
          if (state is errorSigninState) {
            toaster(state.errMessage);
          }
          if (state is SuccessfulSigninState) {
            FirebaseAuth.instance.currentUser!.emailVerified
                ? customReplacementNavigation(context, '/home')
                : toaster('Please Verify your Account');
          }
        },
        builder: (context, state) {
          authCubit auth = BlocProvider.of<authCubit>(context);
          return Form(
            key: auth.Signinkey,
            child: Column(
              children: [
                customTextFormField(
                  text: 'Email',
                  onChanged: (email) {
                    auth.email = email;
                  },
                ),
                SizedBox(height: 30),
                customTextFormField(
                  obsecure: auth.obSecureValue,
                  suffixIcon: IconButton(
                    onPressed: () {
                      auth.obSecureText(newvalue: !auth.obSecureValue);
                    },
                    icon: Icon(
                      auth.obSecureValue
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  text: 'password',
                  onChanged: (password) {
                    auth.password = password;
                  },
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(right: 16),
                  child: forgetPasswordWidget(),
                ),
                SizedBox(height: 150),
                state is loadingSigninState
                    ? CircularProgressIndicator(color: AppColors.PrimaryColor)
                    : Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                        child: custom_Button(
                          onPressed: () async {
                            if (auth.Signinkey.currentState!.validate()) {
                              await auth.signinWithEmailAndPassword();
                            }
                          },
                          text: AppStrings.signIn,
                          color: AppColors.PrimaryColor,
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
