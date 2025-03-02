import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  // Locale? get deviceLocale => PlatformDispatcher.instance.locale;
  const factory AppState(
      {@Default(Locale("en"))
      Locale locale,
      @Default("dark")
      String themeMode,
      GlobalKey<NavigatorState>? navigatorKey}) = _AppState;
}
