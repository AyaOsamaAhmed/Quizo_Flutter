
import 'package:flutter/material.dart';
import 'package:quizo_flutter/modules/auth/createAccount/create_account_screen.dart';

import '../Modules/Splash/splash_screen.dart';

import 'package:go_router/go_router.dart';

import '../modules/auth/login/login_screen.dart';
import '../modules/auth/resetPassword/reset_password_screen.dart';
import '../modules/auth/verifyOTP/verify_otp_screen.dart';

BuildContext? get currentContext_ =>
    GoRouterConfig.router.routerDelegate.navigatorKey.currentContext;

class GoRouterConfig {
  static GoRouter get router => _router;
  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: SplashScreen.routeName,
        name: SplashScreen.routeName,
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const SplashScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: LoginScreen.routeName,
        path: "/${LoginScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const LoginScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: ResetPasswordScreen.routeName,
        path: "/${ResetPasswordScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: ResetPasswordScreen(
            ),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: CreateAccountScreen.routeName,
        path: "/${CreateAccountScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const CreateAccountScreen(
                ),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: VerifyOtpScreen.routeName,
        path: "/${VerifyOtpScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          final Map<String, dynamic> extra =
              state.extra as Map<String, dynamic>;
          return getCustomTransitionPage(
            state: state,
            child: VerifyOtpScreen(
            ),
          );
        },
        routes: const <RouteBase>[],
      ),
    ],
    // redirect: (BuildContext context, GoRouterState state) {
    //   if(!SharedPref.isLogin()) return LoginScreen.routeName;
    //   if(state.matchedLocation == LoginScreen.routeName && SharedPref.isLogin()) return "/${HomeScreen.routeName}";
    //
    //   if(state.matchedLocation == OtpScreen.routeName && state.extra == null){
    //     return ForgotPasswordScreen.routeName;
    //   }
    // },
  );

  static CustomTransitionPage getCustomTransitionPage(
      {required GoRouterState state, required Widget child}) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}
