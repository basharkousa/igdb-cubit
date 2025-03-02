import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igameapp/src/data/repositories/app/app_repo.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AppRepo repository;

  SplashCubit(this.repository) : super(SplashInitial()){
    intSplash();
  }

  intSplash() async {
    Future.delayed(const Duration(milliseconds: 3100), () {
      emit(SplashSuccess());
      // goToHomeScreen();
    });
  }


}