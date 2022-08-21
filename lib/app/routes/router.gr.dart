// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../../src/view/home_page.dart' as _i7;
import '../../src/view/login_page.dart' as _i4;
import '../../src/view/onboarding_page.dart' as _i2;
import '../../src/view/post_errand_page.dart' as _i6;
import '../../src/view/signup_page.dart' as _i3;
import '../../src/view/splash_page.dart' as _i1;
import '../../src/view/tab_page.dart' as _i5;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    OnboardingRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.OnboardingPage());
    },
    SignupRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SignupPage());
    },
    LoginRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.LoginPage());
    },
    TabRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.TabPage());
    },
    PostErrandRoute.name: (routeData) {
      final args = routeData.argsAs<PostErrandRouteArgs>(
          orElse: () => const PostErrandRouteArgs());
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.PostErrandPage(key: args.key));
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.HomePage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(SplashRoute.name, path: '/'),
        _i8.RouteConfig(OnboardingRoute.name, path: '/onboarding-page'),
        _i8.RouteConfig(SignupRoute.name, path: '/signup'),
        _i8.RouteConfig(LoginRoute.name, path: '/login'),
        _i8.RouteConfig(TabRoute.name, path: '/', children: [
          _i8.RouteConfig('#redirect',
              path: '',
              parent: TabRoute.name,
              redirectTo: 'home',
              fullMatch: true),
          _i8.RouteConfig(HomeRoute.name, path: 'home', parent: TabRoute.name)
        ]),
        _i8.RouteConfig(PostErrandRoute.name, path: '/post-errand-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.OnboardingPage]
class OnboardingRoute extends _i8.PageRouteInfo<void> {
  const OnboardingRoute()
      : super(OnboardingRoute.name, path: '/onboarding-page');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i3.SignupPage]
class SignupRoute extends _i8.PageRouteInfo<void> {
  const SignupRoute() : super(SignupRoute.name, path: '/signup');

  static const String name = 'SignupRoute';
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i5.TabPage]
class TabRoute extends _i8.PageRouteInfo<void> {
  const TabRoute({List<_i8.PageRouteInfo>? children})
      : super(TabRoute.name, path: '/', initialChildren: children);

  static const String name = 'TabRoute';
}

/// generated route for
/// [_i6.PostErrandPage]
class PostErrandRoute extends _i8.PageRouteInfo<PostErrandRouteArgs> {
  PostErrandRoute({_i9.Key? key})
      : super(PostErrandRoute.name,
            path: '/post-errand-page', args: PostErrandRouteArgs(key: key));

  static const String name = 'PostErrandRoute';
}

class PostErrandRouteArgs {
  const PostErrandRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'PostErrandRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}
