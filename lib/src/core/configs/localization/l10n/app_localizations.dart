import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_nl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('nl')
  ];

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Hello!'**
  String get title;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'This is English'**
  String get message;

  /// No description provided for @connection_error.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection'**
  String get connection_error;

  /// No description provided for @no_internet.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get no_internet;

  /// No description provided for @looks_like_you_have_lost_connection.
  ///
  /// In en, this message translates to:
  /// **'Looks like you have lost connection with WI-FI or\nother internet connection'**
  String get looks_like_you_have_lost_connection;

  /// No description provided for @try_these_steps.
  ///
  /// In en, this message translates to:
  /// **'Try these steps to get back online:'**
  String get try_these_steps;

  /// No description provided for @check_your_modem_and_router.
  ///
  /// In en, this message translates to:
  /// **'Check your modem and router'**
  String get check_your_modem_and_router;

  /// No description provided for @reconnect_to_Wi_Fi.
  ///
  /// In en, this message translates to:
  /// **'Reconnect to Wi-Fi'**
  String get reconnect_to_Wi_Fi;

  /// No description provided for @reload.
  ///
  /// In en, this message translates to:
  /// **'RELOAD'**
  String get reload;

  /// No description provided for @explore_your_interesting_games.
  ///
  /// In en, this message translates to:
  /// **'Explore your interesting games'**
  String get explore_your_interesting_games;

  /// No description provided for @saved_games.
  ///
  /// In en, this message translates to:
  /// **'Saved Games'**
  String get saved_games;

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// No description provided for @popular_games_right_now.
  ///
  /// In en, this message translates to:
  /// **'Popular games right now'**
  String get popular_games_right_now;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @remove_games.
  ///
  /// In en, this message translates to:
  /// **'Remove games'**
  String get remove_games;

  /// No description provided for @clean_cash.
  ///
  /// In en, this message translates to:
  /// **'Clean Cash'**
  String get clean_cash;

  /// No description provided for @client_secret.
  ///
  /// In en, this message translates to:
  /// **'Client Secret'**
  String get client_secret;

  /// No description provided for @enter_client_secret.
  ///
  /// In en, this message translates to:
  /// **'Enter client secret'**
  String get enter_client_secret;

  /// No description provided for @enter_client_id.
  ///
  /// In en, this message translates to:
  /// **'Enter client id'**
  String get enter_client_id;

  /// No description provided for @client_id.
  ///
  /// In en, this message translates to:
  /// **'Client id'**
  String get client_id;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'nl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'nl': return AppLocalizationsNl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
