import 'package:flutter/material.dart';
import 'package:hms_sv_app/app.dart';
import 'package:hms_sv_app/src/features/auth/presentation/sign_in/sign_in_page.dart';
import 'package:hms_sv_app/src/features/auth/presentation/sign_up/sign_up_page.dart';

class AppRoutes {
  static const startupPage = '/startup-page';
  static const signInPage = '/sign-in-page';
  static const signUpPage = '/sign-up-page';
  static const homePage = '/home-page';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.startupPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const StartupPage(),
          settings: settings,
        );
      case AppRoutes.signInPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SignInPage(),
          settings: settings,
        );
      case AppRoutes.signUpPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SignUpPage(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
