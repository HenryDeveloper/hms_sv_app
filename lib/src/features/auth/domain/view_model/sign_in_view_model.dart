import 'package:hms_sv_app/src/features/auth/domain/model/sign_in_model.dart';

class SignInViewModel {
  final String email;
  final String password;

  SignInViewModel(this.email, this.password);

  SignInModel convertToModel() => SignInModel(email: email, password: password);
}
