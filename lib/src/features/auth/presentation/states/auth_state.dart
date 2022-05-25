import 'package:equatable/equatable.dart';
import 'package:hms_sv_app/src/features/auth/domain/auth_model.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthLoaded<T extends AuthModel> extends AuthState
    implements EquatableMixin {
  final T model;

  const AuthLoaded(this.model);

  @override
  List<Object?> get props => [model];

  @override
  bool? get stringify => true;
}

class AuthError extends AuthState implements EquatableMixin {
  final String? error;
  const AuthError(this.error);

  @override
  List<Object?> get props => [error];

  @override
  bool? get stringify => true;
}
