import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/features/auth/presentation/Widgets/AppName.dart';
import 'package:dalel_app/features/auth/presentation/Widgets/customTextFiledForm.dart';
import 'package:dalel_app/features/auth/presentation/Widgets/haveAnAccount.dart';
import 'package:dalel_app/features/auth/presentation/Widgets/welcomeTextWidget.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';

class signupView extends StatelessWidget {
  signupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 90)),
            SliverToBoxAdapter(child: AppName()),
            SliverToBoxAdapter(child: SizedBox(height: 50)),
            SliverToBoxAdapter(child: welcomeTextWidget()),
            SliverToBoxAdapter(child: SizedBox(height: 30)),
            SliverToBoxAdapter(child: customTextFiledForm()),
            SliverToBoxAdapter(
              child: haveAnAccount(
                onTap: () {
                  customGoNavigation(context, '/signin');
                  // authCubit().isLogin == true
                  //     ? customGoNavigation(context, '/signin')
                  //     : customGoNavigation(context, '/signup');
                },
                text1: authCubit().isLogin
                    ? AppStrings.alreadyHaveAnAccount
                    : AppStrings.dontHaveAnAccount,
                text2: authCubit().isLogin
                    ? AppStrings.signIn
                    : AppStrings.signUp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
