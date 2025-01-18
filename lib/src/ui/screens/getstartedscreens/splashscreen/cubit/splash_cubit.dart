import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:igameapp/src/data/local/datasources/floor/entity/game_entity.dart';
import 'package:igameapp/src/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/data/remote/exceptions/dio_error_util.dart';
import 'package:igameapp/src/data/repository.dart';
import 'package:igameapp/src/data/models/BaseResponse.dart';
import 'package:igameapp/src/ui/screens/gamesscreens/homescreen/home_screen.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final Repository repository;

  SplashCubit(this.repository) : super(SplashInitial()){
    intSplash();
  }

  intSplash() async {
    Future.delayed(const Duration(milliseconds: 3100), () {
      emit(SplashSuccess());
      goToHomeScreen();
    });
  }

  Future<void> goToHomeScreen() async {
    Get.offNamed(HomeScreen.route);
  }
}