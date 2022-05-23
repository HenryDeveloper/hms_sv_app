import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var obscureTextProvider = StateProvider<bool>(
  (ref) => true,
);

class PasswordTextFormField extends ConsumerWidget {
  const PasswordTextFormField(
      {Key? key,
      this.initialValue,
      this.suffixText,
      this.controller,
      this.validator})
      : super(key: key);

  final String? initialValue;
  final String? suffixText;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isObscure = ref.watch(obscureTextProvider);
    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      obscureText: isObscure,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
          suffixText: suffixText,
          suffixIcon: IconButton(
              onPressed: () =>
                  ref.read(obscureTextProvider.notifier).state = !isObscure,
              icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off))),
      validator: validator,
    );
  }
}
