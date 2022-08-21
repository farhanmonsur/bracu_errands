import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bracu_errands/src/view/post_errand_page.dart';
import 'package:bracu_errands/src/view/tab_page.dart';
import 'package:bracu_errands/src/view/home_page.dart';
import 'package:bracu_errands/src/view/splash_page.dart';
import 'package:bracu_errands/src/view/login_page.dart';
import 'package:bracu_errands/src/view/onboarding_page.dart';
import 'package:bracu_errands/src/view/signup_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute<dynamic>(page: SplashPage, initial: true),
    AutoRoute<dynamic>(page: OnboardingPage),
    AutoRoute<dynamic>(
      page: SignupPage,
      path: '/signup',
    ),
    AutoRoute<dynamic>(
      page: LoginPage,
      path: '/login',
    ),
    AutoRoute<dynamic>(
      page: TabPage,
      path: '/',
      children: [
        AutoRoute<dynamic>(
          path: 'home',
          initial: true,
          page: HomePage,
        ),
      ],
    ),
    AutoRoute<dynamic>(page: PostErrandPage),
  ],
)
class $AppRouter {}
