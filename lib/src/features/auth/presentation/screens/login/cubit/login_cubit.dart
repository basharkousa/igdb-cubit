import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igameapp/src/core/data/remote/exceptions/dio_error_util.dart';
import 'package:igameapp/src/features/auth/data/auth_repo.dart';
import 'package:igameapp/src/features/auth/data/models/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _repository;

  LoginCubit(this._repository) : super(LoginInitial({}, false)) {
    intSplash();
  }

  intSplash() async {
    //todo get the token from the storage if it's found isLogin = true and vice versa;
    var token = _repository.getSavedToken();
    if(token != null){
      emit(LoginInitial(state.loginForm, true));
    }
  }

  void postGetToken() async {
    emit(LoginLoading(state.loginForm, false));
    try {
      final response = await _repository.getTokenRequest(state.loginForm);
      emit(LoginSuccess(response.data, state.loginForm, true));
    } on DioException catch (e, t) {
      emit(LoginError(
          DioErrorUtil.handleError(e), state.loginForm, false));
    } catch (e, t) {
      print("LoginError ${e.toString()}/n ${t}");
    }
  }
}
