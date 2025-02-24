import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  // final Locale locale =
  // final String? themeMode;
  // Locale? get deviceLocale => PlatformDispatcher.instance.locale;

  // final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  const factory AppState(
      {@Default(Locale("en"))
      Locale locale,
      GlobalKey<NavigatorState>? navigatorKey}) = _AppState;
}
