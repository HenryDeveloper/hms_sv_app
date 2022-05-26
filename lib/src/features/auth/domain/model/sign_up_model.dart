import 'package:hms_sv_app/src/features/auth/domain/model/auth_model.dart';

class SignUpModel extends AuthModel {
  final String? id;
  final String name;
  final String email;
  final String surname;
  final String password;
  SignUpModel(
      {this.id,
      required this.name,
      required this.email,
      required this.surname,
      required this.password,
      bool? isSuccess})
      : super(isSuccess);
}
