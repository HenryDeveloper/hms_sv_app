import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hms_sv_app/src/common_widgets/password_text_form_field.dart';
import 'package:hms_sv_app/src/constants/strings.dart';
import 'package:hms_sv_app/src/features/auth/domain/view_model/sign_in_view_model.dart';
import 'package:hms_sv_app/src/features/auth/presentation/states/auth_state.dart';
import 'package:hms_sv_app/src/global_provider.dart';
import 'package:hms_sv_app/src/routing/app_router.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  @override
  void dispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(authControllerProvider);

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
                    controller: emailTextEditingController,
                    validator: _validateValue,
                    decoration: const InputDecoration(
                        labelText: Strings.emailTextFormFieldText,
                        icon: Icon(Icons.email)),
                  ),
                  PasswordTextFormField(
                    controller: passwordTextEditingController,
                    validator: _validateValue,
                    icon: const Icon(Icons.password),
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
                  state is AuthLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () async {
                            final formState = _formKey.currentState;

                            if (formState != null && formState.validate()) {
                              final viewModel = SignInViewModel(
                                  emailTextEditingController.text.trimRight(),
                                  passwordTextEditingController.text);

                              await ref
                                  .read(authControllerProvider.notifier)
                                  .signInUser(viewModel);
                            }
                          },
                          child: const Text(Strings.startButtonText)),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text(Strings.seeServicesButtonText))
                ],
              )),
        ));
  }

  String? _validateValue(String? value) {
    if (value == null || value.isEmpty) {
      return "Tiene que tener un valor";
    }

    return null;
  }
}
