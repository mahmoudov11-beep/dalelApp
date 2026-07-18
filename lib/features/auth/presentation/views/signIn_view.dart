import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/auth/presentation/Widgets/customloginForm.dart';
import 'package:dalel_app/features/auth/presentation/Widgets/haveAnAccount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class signin_view extends StatelessWidget {
  const signin_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.PrimaryColor),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 290,
              decoration: BoxDecoration(color: AppColors.PrimaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppStrings.appName,
                    style: custom_text_styles.SairaStyle700Size32,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(Assets.assetsImagesVector1),
                      SvgPicture.asset(Assets.assetsImagesVector2),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(child: customSigninForm()),
          SliverToBoxAdapter(child: SizedBox(height: 6)),
          SliverToBoxAdapter(
            child: haveAnAccount(
              onTap: () {
                customReplacementNavigation(context, '/signup');
              },
              text1: AppStrings.dontHaveAnAccount,
              text2: AppStrings.createAccount,
            ),
          ),
        ],
      ),
    );
  }
}
