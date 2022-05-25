import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hms_sv_app/src/common_widgets/password_text_form_field.dart';
import 'package:hms_sv_app/src/constants/strings.dart';
import 'package:hms_sv_app/src/routing/app_router.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: Strings.emailTextFormFieldText,
                        icon: Icon(Icons.email)),
                  ),
                  const PasswordTextFormField(
                    icon: Icon(Icons.password),
                    labelText: Strings.passwordTextFormFieldText,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () async => await Navigator.pushNamed(
                            context, AppRoutes.signUpPage),
                        child: const Text(Strings.registerButtonText)),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(Strings.restorePasswordButtonText)),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text(Strings.startButtonText)),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text(Strings.seeServicesButtonText))
                ],
              )),
        ));
  }
}
