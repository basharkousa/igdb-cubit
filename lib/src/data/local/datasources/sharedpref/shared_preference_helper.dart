import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../../../../data/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants/preferences.dart';

class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // General Methods: ----------------------------------------------------------

  Future<void> saveUser(User user) async {
      user.userId != null
          ? _sharedPreference.setString(Preferences.userId, user.userId!)
          : {};
      user.name != null ? _sharedPreference.setString(Preferences.name, user.name!) : {};
      user.lastName != null ? _sharedPreference.setString(Preferences.lastName, user.lastName!) : {};
      user.dob != null ? _sharedPreference.setString(Preferences.dob, user.dob!) : {};
      user.gender != null
          ? _sharedPreference.setString(Preferences.gender, user.gender!)
          : {};
      user.mobile != null
          ? _sharedPreference.setString(Preferences.mobile, user.mobile!)
          : {};
      user.email != null ? _sharedPreference.setString(Preferences.email, user.email!) : {};
      user.password != null ? _sharedPreference.setString(Preferences.password, user.password!) : {};
      user.image != null ? _sharedPreference.setString(Preferences.userImage, user.image!) : {};

  }

  Future<User> getUser() async {
      return User(
        name: _sharedPreference.getString(Preferences.name),
        lastName: _sharedPreference.getString(Preferences.lastName),
        password: _sharedPreference.getString(Preferences.password),
        email: _sharedPreference.getString(Preferences.email),
        mobile: _sharedPreference.getString(Preferences.mobile),
        contact_id: _sharedPreference.getString(Preferences.contactId),
        dob: _sharedPreference.getString(Preferences.dob),
        gender: _sharedPreference.getString(Preferences.gender),
        image: _sharedPreference.getString(Preferences.userImage),
      );
  }

  Future<void> removeUser() async {
      _sharedPreference.remove(Preferences.name);
      _sharedPreference.remove(Preferences.lastName);
      _sharedPreference.remove(Preferences.password);
      _sharedPreference.remove(Preferences.email);
      _sharedPreference.remove(Preferences.mobile);
      _sharedPreference.remove(Preferences.contactId);
      _sharedPreference.remove(Preferences.dob);
      _sharedPreference.remove(Preferences.gender);
      _sharedPreference.remove(Preferences.userImage);
       print('UserRemoved');
  }

  Future<void> saveSearchQuery(List<String> queryList) async {
    _sharedPreference.setStringList(Preferences.historySearch, queryList);
  }

  Future<List<String>> get historySearchList async{
    return _sharedPreference.getStringList(Preferences.historySearch)??[];
  }

  bool get isDarkMode {
      return _sharedPreference.getBool(Preferences.is_dark_mode) ?? false;
  }

  Future<void> changeBrightnessToDark(bool value) {
      return _sharedPreference.setBool(Preferences.is_dark_mode, value);
  }

  String? get themeMode {
    return _sharedPreference.getString(Preferences.theme_mode)??"dark";
  }

  // Language:---------------------------------------------------
  String? get currentLanguage {
    return _sharedPreference.getString('language_code')??"en";
  }

  Future<Locale> fetchLocale() async {
    Locale locale = const Locale('en', 'US');
    print("Current_Language_preff ${_sharedPreference.getString('language_code')}");
    if (_sharedPreference.getString('language_code') == null) {
      locale = const Locale('en', 'US');
      return locale;
    }
    locale = Locale(_sharedPreference.getString('language_code')!);
    return locale;
  }

  // Future<void> changeLanguage(String language) {
  //   return _sharedPreference.then((prefs) {
  //     return prefs.setString(Preferences.current_language, language);
  //   });
  // }

}
