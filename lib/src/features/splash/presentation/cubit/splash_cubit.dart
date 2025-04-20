import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igameapp/src/features/auth/data/auth_repo.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AuthRepo repository;

  SplashCubit(this.repository) : super(SplashInitial()) {
    intSplash();
  }

  intSplash() async {
    Future.delayed(const Duration(milliseconds: 3100), () async {
      var token = repository.getSavedToken();
      print("Token: $token");
      if (token != null) {
        emit(SplashSuccess());
      } else {
        emit(SplashError(""));
      }
      // goToHomeScreen();
    });
  }
}
