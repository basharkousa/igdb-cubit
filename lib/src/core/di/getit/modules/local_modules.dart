import 'package:igameapp/src/core/data/local/datasources/floor/app_database.dart';
import 'package:igameapp/src/core/data/local/datasources/sharedpref/shared_preference_helper.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';


@module
abstract class LocalModule {

  @preResolve
  @lazySingleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  SharedPreferenceHelper sharedPreferenceHelper(
          SharedPreferences sharedPreferences) =>
      SharedPreferenceHelper(sharedPreferences);

  @preResolve
  @lazySingleton
  Future<AppDatabase> get database async =>
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

}
