import 'package:flutter/material.dart';
import 'package:hms_sv_app/src/constants/strings.dart';

class StartupPage extends StatelessWidget {
  const StartupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
            onPressed: () => {}, child: const Text(Strings.signInButtonText)),
        ElevatedButton(
            onPressed: () => {}, child: const Text(Strings.registerTextButton)),
        ElevatedButton(
            onPressed: () => {},
            child: const Text(Strings.seeServicesTextButton))
      ]),
    );
  }
}
