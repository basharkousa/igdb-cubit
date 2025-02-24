import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class Localization {
  // Default locale
  static Locale locale = const Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
    'Dutch',
  ];
  // Supported locales
  // Needs to be same order with langs
  static final supportedLocales = [
    const Locale('en', 'US'),
    const Locale('nl'),
  ];

  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      locale = const Locale('en','US');
      return Null;
    }
    locale = Locale(prefs.getString('language_code')!);
    return Null;
  }

  static void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (locale == type) {
      return;
    }
    if (type == const Locale("nl")) {
      locale = const Locale("nl");
      await prefs.setString('language_code', 'nl');
      await prefs.setString('countryCode', '');
      print("updateLocale to nl");
      // Get.updateLocale(type);
      // Get.changeTheme(AppTheme.lightTheme(type.languageCode));
    } else {
      locale = const Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
      print("updateLocale to en");
      // Get.updateLocale(type);
      // Get.changeTheme(AppTheme.lightTheme(type.languageCode));
    }

  }

}
