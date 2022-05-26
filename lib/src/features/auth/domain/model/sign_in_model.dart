import 'package:hms_sv_app/src/features/auth/domain/model/auth_model.dart';

class SignInModel extends AuthModel {
  final String email;
  final String password;

  SignInModel({bool? isSuccess, required this.email, required this.password})
      : super(isSuccess);
}
