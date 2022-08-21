// ignore_for_file: lines_longer_than_80_chars

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bracu_errands/app/constants/app_assets.dart';
import 'package:bracu_errands/app/constants/app_colors.dart';
import 'package:bracu_errands/app/constants/app_padding.dart';
import 'package:bracu_errands/app/constants/app_spacing.dart';
import 'package:bracu_errands/src/view/components/primary_button.dart';
import 'package:bracu_errands/src/view/components/subtitle_widget.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: defaultScaffoldPadding,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Center(
                  child: SvgPicture.asset(
                    logoUri,
                    height: 500.h,
                    width: double.infinity,
                    // fit: BoxFit.cover,
                  ),
                ),
                verticalSpacing40,
                PrimaryButton(
                  text: 'Sign up',
                  onTap: () {
                    // context.read<RegisterFormBloc>().add(
                    //     RegisterFormEvent.,
                    //   ),
                    context.router.pushNamed('/signup');
                  },
                ),
                verticalSpacing16,
                PrimaryButton(
                  text: 'Login',
                  type: ButtonType.secondary,
                  onTap: () {
                    context.router.pushNamed('/login');
                  },
                ),
                verticalSpacing32,
                verticalSpacing40,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
