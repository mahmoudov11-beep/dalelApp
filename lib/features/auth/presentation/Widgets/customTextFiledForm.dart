import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/functions/toast_function.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/features/auth/presentation/Widgets/checkBoxWidget.dart';
import 'package:dalel_app/features/auth/presentation/Widgets/customTextField.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel_app/features/splash/presentation/views/custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class customTextFiledForm extends StatelessWidget {
  const customTextFiledForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => authCubit(),
      child: BlocConsumer<authCubit, SignUpState>(
        listener: (context, state) {
          if (state is errorState) {
            toaster(state.errMessage);
          }
          if (state is SuccessfulState) {
            toaster('Account created succefully');
            customReplacementNavigation(context, '/home');
          }
        },
        builder: (context, state) {
          authCubit auth = BlocProvider.of<authCubit>(context);
          return Form(
            key: auth.key,
            child: Column(
              children: [
                customTextFormField(
                  text: 'First Name',
                  onChanged: (firstName) {
                    auth.firstName = firstName;
                  },
                ),
                SizedBox(height: 30),
                customTextFormField(
                  text: 'Last Name',
                  onChanged: (lastName) {
                    auth.lastName = lastName;
                  },
                ),
                SizedBox(height: 30),
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

                checkBoxWidget(),
                SizedBox(height: 150),
                state is loadingState
                    ? CircularProgressIndicator(color: AppColors.PrimaryColor)
                    : custom_Button(
                        onPressed: () {
                          if (auth.termsAndConditionValue == true) {
                            if (auth.key.currentState!.validate()) {
                              auth.signUpwithemailAndPassword();
                            }
                          }
                        },
                        text: AppStrings.signUp,
                        color: auth.termsAndConditionValue == false
                            ? AppColors.grey
                            : null,
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
