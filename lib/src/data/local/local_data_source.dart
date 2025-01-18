import 'dart:ui';
import 'package:igameapp/src/data/local/datasources/floor/dao/game_dao.dart';
import 'package:igameapp/src/data/local/datasources/floor/entity/game_entity.dart';

import '../../data/local/datasources/sharedpref/shared_preference_helper.dart';
import '../../data/models/user/user.dart';

class LocalDataSource {

  final SharedPreferenceHelper _sharedPrefsHelper;
  final GameDao _gameDao;

  LocalDataSource(this._sharedPrefsHelper,this._gameDao);


  /* --------------------------------Floor METHODS------------------------------------- */

  Future<List<GameEntity>> getGamesList() =>
      _gameDao.findAllGames();

  Future<void> addGameItem(GameEntity game) =>
      _gameDao.insertGame(game);

  Future<void> addGameList(List<GameEntity> games) =>
      _gameDao.insertGames(games);

  Future<void> removeGames() =>
      _gameDao.deleteAllGames();



  /* --------------------------------SHERED_PREFFERNCES METHODES------------------------------------- */


  Future<Locale> get fetchLocale => _sharedPrefsHelper.fetchLocale();

  Future<User> getUser() => _sharedPrefsHelper.getUser();

  Future<void> saveUser(User user) => _sharedPrefsHelper.saveUser(user);

  Future<void> removeUser() => _sharedPrefsHelper.removeUser();

  Future<List<String>> get getSearchHistoryList =>
      _sharedPrefsHelper.historySearchList;

  Future<void> saveSearchQuery(String query) async {
    List<String> listH = await _sharedPrefsHelper.historySearchList;
    listH.add(query);
    List<String> reversedList = List.from(listH.reversed);
    return _sharedPrefsHelper.saveSearchQuery(reversedList);
    // return _sharedPrefsHelper.saveSearchQuery([]);
  }



}
