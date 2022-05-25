import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hms_sv_app/src/common_widgets/password_text_form_field.dart';
import 'package:hms_sv_app/src/constants/strings.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _formGlobal = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
            key: _formGlobal,
            child: Column(
              children: [
                const Text(
                  "Registro",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.badge_outlined),
                    labelText: Strings.nameTextFormFieldText,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.badge_outlined),
                    labelText: Strings.surnameTextFormFieldText,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: Strings.emailTextFormFieldText,
                  ),
                ),
                const PasswordTextFormField(
                  labelText: Strings.passwordTextFormFieldText,
                  icon: Icon(Icons.password),
                ),
                ElevatedButton(
                    onPressed: (() => {}),
                    child: const Text(Strings.signUpButtonText))
              ],
            )),
      ),
    );
  }
}
