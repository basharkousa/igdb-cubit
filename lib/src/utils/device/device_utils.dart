//
import 'package:flutter/material.dart';
import '../../../generated/fonts.gen.dart';

/// Helper class for device related operations.
///
class DeviceUtils {
  ///
  /// hides the keyboard if its already open
  ///
  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  ///
  /// accepts a double [scale] and returns scaled sized based on the screen
  /// orientation
  ///
  static double getScaledSize(BuildContext context, double scale) =>
      scale *
      (MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.height);

  ///
  /// accepts a double [scale] and returns scaled sized based on the screen
  /// width
  ///
  static double getScaledWidth(BuildContext context, double scale) =>
      scale * MediaQuery.of(context).size.width;

  ///
  /// accepts a double [scale] and returns scaled sized based on the screen
  /// height
  ///
  static double getScaledHeight(BuildContext context, double scale) =>
      scale * MediaQuery.of(context).size.height;

  // static String getAppString(BuildContext context, String str) {
  //   return AppLocalizations.of(context).translate(str);
  // }

  static String getFontFamily(String locale) {
    switch (locale) {
      case 'en':
        return FontFamily.montserrat;
      case 'ar':
        return FontFamily.plexSansArabic;
      default :
        return FontFamily.plexSansArabic;
    }
  }
}
