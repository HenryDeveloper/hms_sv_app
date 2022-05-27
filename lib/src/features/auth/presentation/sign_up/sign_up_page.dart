import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hms_sv_app/src/common_widgets/password_text_form_field.dart';
import 'package:hms_sv_app/src/constants/strings.dart';
import 'package:hms_sv_app/src/features/auth/domain/view_model/sign_up_view_model.dart';
import 'package:hms_sv_app/src/features/auth/presentation/states/auth_state.dart';
import 'package:hms_sv_app/src/global_provider.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _formGlobal = GlobalKey<FormState>();

  final nameTextEditingController = TextEditingController();
  final surnameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final confirmPasswordTextEditingController = TextEditingController();

  @override
  void dispose() {
    nameTextEditingController.dispose();
    surnameTextEditingController.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    confirmPasswordTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
              key: _formGlobal,
              child: Column(
                children: [
                  const Text(
                    "Registro",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  TextFormField(
                    controller: nameTextEditingController,
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    validator: _validateValue,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.badge_outlined),
                      labelText: Strings.nameTextFormFieldText,
                    ),
                  ),
                  TextFormField(
                    controller: surnameTextEditingController,
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    validator: _validateValue,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.badge_outlined),
                      labelText: Strings.surnameTextFormFieldText,
                    ),
                  ),
                  TextFormField(
                    controller: emailTextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateValue,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: Strings.emailTextFormFieldText,
                    ),
                  ),
                  PasswordTextFormField(
                    controller: passwordTextEditingController,
                    labelText: Strings.passwordTextFormFieldText,
                    validator: _validateValue,
                    icon: const Icon(Icons.password),
                  ),
                  PasswordTextFormField(
                    controller: confirmPasswordTextEditingController,
                    labelText: Strings.confirmPasswordTextFormFieldText,
                    validator: _validateValue,
                    icon: const Icon(Icons.password),
                  ),
                  authState is AuthLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () async {
                            var formState = _formGlobal.currentState;
                            if (formState != null && formState.validate()) {
                              var viewModel = SignUpViewModel(
                                  name: nameTextEditingController.text,
                                  surname: surnameTextEditingController.text,
                                  email: emailTextEditingController.text,
                                  password: passwordTextEditingController.text);

                              await ref
                                  .read(authControllerProvider.notifier)
                                  .signUpUser(viewModel);

                              if (!mounted) return;

                              Navigator.pop(context);
                            }
                          },
                          child: const Text(Strings.signUpButtonText))
                ],
              )),
        ),
      ),
    );
  }

  String? _validateValue(String? value) {
    if (value == null || value.isEmpty) {
      return "Tiene que tener un valor";
    }

    return null;
  }
}
