import 'package:flutter/material.dart';
import 'package:igameapp/src/core/configs/localization/l10n/app_localizations.dart';
import 'package:igameapp/src/core/configs/localization/l10n/app_localizations_en.dart';

extension BuildContextHelper on BuildContext {

  AppLocalizations get l => AppLocalizations.of(this) ?? AppLocalizationsEn();

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Returns the current theme's color scheme.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Returns the current theme's text theme.
  TextTheme get textTheme => Theme.of(this).textTheme;


  /// Returns the current theme's primary color.
  Color get primaryColor => Theme.of(this).primaryColor;

  /// Returns the current theme's secondary color.
  Color get secondaryColor => colorScheme.secondary;

  /// Returns the current theme's onSecondary color.
  Color get onSecondaryColor => colorScheme.onSecondary;

  /// Returns the current theme's backgroundColor color.
  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;
  /// Returns the current theme's backgroundColor color.
  Color get hintColor => Theme.of(this).hintColor;

  /// Returns the current theme's AppBarTheme.
  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;

  /// Returns the current theme's IconThemeData.
  IconThemeData get iconTheme => Theme.of(this).iconTheme;

  /// Returns the current theme's DialogTheme.
  DialogThemeData get dialogTheme => Theme.of(this).dialogTheme;

  /// Returns the current theme's BottomNavigationBarThemeData.
  BottomNavigationBarThemeData get bottomNavigationBarTheme => Theme.of(this).bottomNavigationBarTheme;

  /// Returns the current theme's FloatingActionButtonThemeData.
  FloatingActionButtonThemeData get floatingActionButtonTheme => Theme.of(this).floatingActionButtonTheme;

  Color get scaffoldBackground => Theme.of(this).scaffoldBackgroundColor;


  /// Returns the width of the screen.
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Returns the height of the screen.
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Returns the size of the screen.
  Size get screenSize => MediaQuery.of(this).size;

  /// Returns the orientation of the screen.
  Orientation get orientation => MediaQuery.of(this).orientation;

  /// Returns the padding of the screen.
  EdgeInsets get padding => MediaQuery.of(this).padding;

  /// Returns the view insets of the screen.
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  /// Returns the view padding of the screen.
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  /// Returns the device pixel ratio of the screen.
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  /// Returns the text scale factor of the screen.
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;

  /// Returns the platform brightness of the screen.
  Brightness get platformBrightness => MediaQuery.of(this).platformBrightness;

  /// Returns the accessible navigation bar height.
  double get navigationBarHeight => MediaQuery.of(this).padding.bottom;

  /// Returns the accessible status bar height.
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  void showSnackBarMessage(
      String? msg, {
        VoidCallback? onTap, // Use VoidCallback for onTap
        bool? isDismissible,
        Duration? duration,
      }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(msg ?? "msg"), // Use Text widget for content
        duration: duration ?? const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating, // Recommended for modern look
        dismissDirection: isDismissible == false ? null : DismissDirection.down, // control dismissible
        backgroundColor: Colors.white,
        // Add custom icon if needed (using a Row for better layout)
        // action: SnackBarAction(
        //   label: 'Action',
        //   onPressed: () {
        //     // Code to execute.
        //   },
        // ),
        // shape: RoundedRectangleBorder( // Optional: Customize shape
        //   borderRadius: BorderRadius.circular(8),
        // ),
      ),
    );
  }

}
