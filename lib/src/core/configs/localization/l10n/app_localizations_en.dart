// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Hello!';

  @override
  String get message => 'This is English';

  @override
  String get connection_error => 'Please check your internet connection';

  @override
  String get no_internet => 'No Internet Connection';

  @override
  String get looks_like_you_have_lost_connection => 'Looks like you have lost connection with WI-FI or\nother internet connection';

  @override
  String get try_these_steps => 'Try these steps to get back online:';

  @override
  String get check_your_modem_and_router => 'Check your modem and router';

  @override
  String get reconnect_to_Wi_Fi => 'Reconnect to Wi-Fi';

  @override
  String get reload => 'RELOAD';

  @override
  String get explore_your_interesting_games => 'Explore your interesting games';

  @override
  String get saved_games => 'Saved Games';

  @override
  String get summary => 'Summary';

  @override
  String get popular_games_right_now => 'Popular games right now';

  @override
  String get add => 'Add';

  @override
  String get update => 'Update';

  @override
  String get edit => 'Edit';

  @override
  String get delete => 'Delete';

  @override
  String get settings => 'Settings';

  @override
  String get remove_games => 'Remove games';

  @override
  String get clean_cash => 'Clean Cash';
}
