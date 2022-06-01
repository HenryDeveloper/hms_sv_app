import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hms_sv_app/src/features/auth/application/auth_service.dart';
import 'package:hms_sv_app/src/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:hms_sv_app/src/features/auth/presentation/controller/auth_controller.dart';
import 'package:hms_sv_app/src/features/auth/presentation/states/auth_state.dart';

// firebaseAuth providers
final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);

final authStateChangesProvider = StreamProvider.autoDispose<User?>(
  (ref) => ref.watch(firebaseAuthProvider).authStateChanges(),
);
// firebaseAuth providers

// firebaseCrashlytics providers
final firebaseCrashlyticsProvider =
    Provider<FirebaseCrashlytics>((ref) => FirebaseCrashlytics.instance);
// firebaseCrashlytics providers

// auth logic providers
final firebaseAuthRepositoryProvider =
    Provider.autoDispose<FirebaseAuthRepository>(
        (ref) => FirebaseAuthRepository(ref.watch(firebaseAuthProvider)));

final authServiceProvider = Provider.autoDispose<AuthService>(
    (ref) => AuthService(ref.watch(firebaseAuthRepositoryProvider)));

final authControllerProvider =
    StateNotifierProvider.autoDispose<AuthController, AuthState>((ref) {
  final authService = ref.watch(authServiceProvider);
  final firebaseCrashlytics = ref.watch(firebaseCrashlyticsProvider);

  return AuthController(authService, firebaseCrashlytics);
});
// auth logic providers

// home logic providers
final selectedIndexProvider = StateProvider.autoDispose<int>((ref) => 0);
// home logic providers