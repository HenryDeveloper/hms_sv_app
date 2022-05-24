import 'package:flutter/material.dart';
import 'package:hms_sv_app/src/constants/strings.dart';
import 'package:hms_sv_app/src/routing/app_router.dart';

class StartupPage extends StatelessWidget {
  const StartupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
            onPressed: () async =>
                await Navigator.pushNamed(context, AppRoutes.signInPage),
            child: const Text(Strings.signInButtonText)),
        ElevatedButton(
            onPressed: () async =>
                await Navigator.pushNamed(context, AppRoutes.signUpPage),
            child: const Text(Strings.registerButtonText)),
        ElevatedButton(
            onPressed: () => {},
            child: const Text(Strings.seeServicesButtonText))
      ]),
    );
  }
}
