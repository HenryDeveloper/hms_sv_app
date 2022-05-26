import 'package:equatable/equatable.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthLoaded extends AuthState implements EquatableMixin {
  final bool isSuccess;

  const AuthLoaded(this.isSuccess);

  @override
  List<Object?> get props => [isSuccess];

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
