import 'package:flutter/cupertino.dart';
import 'package:igameapp/src/configs/localization/l10n/app_localizations.dart';
import 'package:igameapp/src/configs/localization/l10n/app_localizations_en.dart';

extension BuildContextHelper on BuildContext {
  AppLocalizations get l {
    // if no locale was found, returns a default
    return AppLocalizations.of(this) ?? AppLocalizationsEn();
  }
}
