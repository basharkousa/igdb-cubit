import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igameapp/src/features/auth/data/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  final AuthRepo repository;

  LoginCubit(this.repository) : super(LoginInitial({}));

  intSplash() async {

  }

  void postGetToken() {
    print("postGetToken");
  }


}