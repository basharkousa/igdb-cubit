part of 'login_cubit.dart';

@immutable
sealed class LoginState {
  final Map<String, dynamic> loginForm;

  const LoginState(this.loginForm);
}

class LoginInitial extends LoginState {
  const LoginInitial(super.loginForm);
}

class LoginLoading extends LoginState {
  const LoginLoading(super.loginForm);
}

class LoginSuccess extends LoginState {
  const LoginSuccess(super.loginForm);
}

class LoginError extends LoginState {
  final String message;

  const LoginError(this.message, super.loginForm);
}
