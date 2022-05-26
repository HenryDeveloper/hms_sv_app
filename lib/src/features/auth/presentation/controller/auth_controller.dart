import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hms_sv_app/src/features/auth/application/auth_service.dart';
import 'package:hms_sv_app/src/features/auth/domain/view_model/sign_in_view_model.dart';
import 'package:hms_sv_app/src/features/auth/domain/view_model/sign_up_view_model.dart';
import 'package:hms_sv_app/src/features/auth/presentation/states/auth_state.dart';

class AuthController extends StateNotifier<AuthState> {
  final AuthService authService;
  final FirebaseCrashlytics firebaseCrashlytics;

  AuthController(this.authService, this.firebaseCrashlytics)
      : super(const AuthInitial());

  Future<void> signUpUser(SignUpViewModel viewModel) async {
    state = const AuthLoading();

    try {
      final isSuccess = await authService.createUser(viewModel);
      state = AuthLoaded(isSuccess);
    } catch (e, s) {
      firebaseCrashlytics.recordError(e, s);
      state = AuthError(e.toString());
    }
  }

  Future<void> signInUser(SignInViewModel viewModel) async {
    state = const AuthLoading();

    try {
      final isSuccess = await authService.logIn(viewModel);
      state = AuthLoaded(isSuccess);
    } catch (e, s) {
      firebaseCrashlytics.recordError(e, s);
      state = AuthError(e.toString());
    }
  }
}
