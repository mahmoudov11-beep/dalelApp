import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/auth/presentation/Widgets/customPasswordResetForm.dart';
import 'package:dalel_app/features/auth/presentation/Widgets/forgotPasswordImageWidget.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class forgotPasswordView extends StatelessWidget {
  const forgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => authCubit(),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 108)),
            SliverToBoxAdapter(
              child: Text(
                textAlign: TextAlign.center,
                AppStrings.forgotPassword,
                style: custom_text_styles.PoppinsStyleBoldSize28,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 32)),
            SliverToBoxAdapter(child: forgotPasswordImageWidget()),
            SliverToBoxAdapter(child: passwordResetForm()),
            SliverToBoxAdapter(
              child: TextButton(
                onPressed: () {
                  customReplacementNavigation(context, '/signin');
                },
                child: Text('back to Login Page'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
