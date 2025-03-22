part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {
  SplashInitial();
}

class SplashLoading extends SplashState {}

class SplashSuccess extends SplashState {
  SplashSuccess();
}

class SplashError extends SplashState {
  final String message;

  SplashError(this.message,);
}