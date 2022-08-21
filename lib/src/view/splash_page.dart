import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bracu_errands/app/constants/app_assets.dart';
import 'package:bracu_errands/app/constants/app_colors.dart';
import 'package:bracu_errands/app/routes/router.gr.dart';
import 'package:bracu_errands/src/controller/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.initial) {
        } else if (state.authenticated) {
          context.router.replace(const TabRoute());
        } else if (state.unauthenticated) {
          context.router.replace(const OnboardingRoute());
        }
      },
      child: Scaffold(
        backgroundColor: bgColor,
        body: Center(
          child: BounceInDown(
            duration: const Duration(milliseconds: 1500),
            child: SvgPicture.asset(
              logoUri,
              width: double.infinity,
              // fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
