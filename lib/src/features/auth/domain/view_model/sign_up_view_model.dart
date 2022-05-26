import 'package:hms_sv_app/src/features/auth/domain/model/sign_up_model.dart';

class SignUpViewModel {
  final String name;
  final String surname;
  final String email;
  final String password;

  SignUpViewModel(
      {required this.name,
      required this.surname,
      required this.email,
      required this.password});

  SignUpModel convertToModel() => SignUpModel(
      name: name, email: email, surname: surname, password: password);
}
