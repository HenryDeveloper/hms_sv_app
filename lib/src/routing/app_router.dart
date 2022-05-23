import 'package:flutter/material.dart';
import 'package:hms_sv_app/app.dart';

class AppRoutes {
  static const startupPage = '/startup-page';
  static const signInPhonePage = '/sign-in-page';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.startupPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const StartupApp(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
