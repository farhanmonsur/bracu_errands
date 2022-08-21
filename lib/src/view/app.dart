import 'package:bracu_errands/injection.dart';
import 'package:bracu_errands/src/controller/auth_bloc.dart';
import 'package:bracu_errands/src/controller/errand_cubit.dart';
import 'package:bracu_errands/src/controller/login_form/login_form_bloc.dart';
import 'package:bracu_errands/src/controller/register_form/register_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bracu_errands/app/constants/app_colors.dart';
import 'package:bracu_errands/app/routes/router.gr.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        ),
        BlocProvider<LoginFormBloc>(
          create: (context) => getIt<LoginFormBloc>(),
        ),
        BlocProvider<RegisterFormBloc>(
          create: (context) => getIt<RegisterFormBloc>(),
        ),
        BlocProvider<ErrandCubit>(
          create: (context) => getIt<ErrandCubit>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, _) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          builder: EasyLoading.init(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(),
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: Colors.transparent,
              elevation: 0,
              titleTextStyle: TextStyle(
                color: Colors.black,
              ),
            ),
            disabledColor: neutral300,
            canvasColor: canvasColor,
            fontFamily: GoogleFonts.jost().fontFamily,
            colorScheme: ColorScheme.fromSwatch(
              accentColor: accentColor,
            ).copyWith(
              primary: accentColor,
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: accentColor,
              selectedIconTheme: const IconThemeData(color: accentColor),
              selectedLabelStyle: TextStyle(
                color: accentColor,
                fontSize: 16.sp,
              ),
              unselectedItemColor: neutral300,
              unselectedIconTheme: const IconThemeData(color: neutral300),
              unselectedLabelStyle: TextStyle(
                color: neutral300,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
