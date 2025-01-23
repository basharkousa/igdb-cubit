import 'package:igameapp/src/data/local/datasources/floor/app_database.dart';
import 'package:igameapp/src/data/local/datasources/floor/dao/game_dao.dart';
import 'package:igameapp/src/data/local/datasources/sharedpref/shared_preference_helper.dart';
import 'package:igameapp/src/data/local/local_data_source.dart';
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

  @lazySingleton
  GameDao gameDao(AppDatabase database) => database.gameDao;

  @lazySingleton
  LocalDataSource localDataSource(
      SharedPreferenceHelper sharedPreferenceHelper,GameDao gameDao) =>
      LocalDataSource(sharedPreferenceHelper,gameDao);
}
