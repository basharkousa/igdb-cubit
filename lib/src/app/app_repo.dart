import 'dart:ui';
import '../core/data/local/datasources/sharedpref/shared_preference_helper.dart';

class AppRepo{

  final SharedPreferenceHelper _sharedPrefsHelper;

  AppRepo(this._sharedPrefsHelper);

  Future<Locale> get fetchLocale => _sharedPrefsHelper.fetchLocale();
  Locale get currentLanguage => Locale(_sharedPrefsHelper.currentLanguage??"en");

  Future<void> changeLocale(String code) =>
      _sharedPrefsHelper.changeLanguage(code);

  String? get themeMode => _sharedPrefsHelper.themeMode??"dark";

  Future<void> changeTheme(String theme) =>
      _sharedPrefsHelper.changeTheme(theme);
}