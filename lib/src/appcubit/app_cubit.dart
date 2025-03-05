import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:igameapp/src/core/data/repositories/app/app_repo.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final AppRepo _appRepo;

   AppCubit(this._appRepo)
      : super(AppState(
            locale: _appRepo.currentLanguage,
            themeMode: _appRepo.themeMode ?? "dark")) {
    // getSavedLanguage();
  }

  Future<void> getSavedLanguage() async {
    final cachedLanguageCode = await _appRepo.fetchLocale;
    emit(state.copyWith(locale: Locale(cachedLanguageCode.languageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await _appRepo.changeLocale(languageCode);
    emit(state.copyWith(locale: Locale(languageCode)));
  }

  void changeAppTheme(String value) async {
    _appRepo.changeTheme(value);
    emit(state.copyWith(themeMode: value));
  }
}
