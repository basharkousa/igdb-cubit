part of 'login_cubit.dart';

@immutable
sealed class LoginState {
  final Map<String, dynamic> loginForm;
  final bool isLoggedIn;
  const LoginState(this.loginForm,this.isLoggedIn);
}

class LoginInitial extends LoginState {
  const LoginInitial(super.loginForm,super.isLoggedIn);
}

class LoginLoading extends LoginState {
  const LoginLoading(super.loginForm,super.isLoggedIn);
}

class LoginSuccess extends LoginState {
  final LoginModel? loginResponse;
  const LoginSuccess(this.loginResponse,super.loginForm,super.isLoggedIn);
}

class LoginError extends LoginState {
  final String message;

  const LoginError(this.message, super.loginForm,super.isLoggedIn);
}
