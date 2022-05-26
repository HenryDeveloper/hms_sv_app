import 'package:hms_sv_app/src/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:hms_sv_app/src/features/auth/domain/view_model/sign_in_view_model.dart';
import 'package:hms_sv_app/src/features/auth/domain/view_model/sign_up_view_model.dart';

abstract class IAuthService {
  Future<bool> createUser(SignUpViewModel signUpViewModel);
  Future<bool> logIn(SignInViewModel signInViewModel);
  Future<void> logOut();
}

class AuthService implements IAuthService {
  final IFirebaseAuthRepository firebaseAuthRepository;

  AuthService(this.firebaseAuthRepository);

  @override
  Future<bool> createUser(SignUpViewModel signUpViewModel) async {
    await firebaseAuthRepository.createUser(signUpViewModel.convertToModel());
    return true;
  }

  @override
  Future<bool> logIn(SignInViewModel signInViewModel) async {
    await firebaseAuthRepository.logIn(signInViewModel.convertToModel());
    return true;
  }

  @override
  Future<void> logOut() async => await firebaseAuthRepository.logOut();
}
