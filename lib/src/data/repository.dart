import 'dart:ui';
import 'package:igameapp/src/data/local/datasources/floor/entity/game_entity.dart';
import 'package:igameapp/src/data/models/BaseResponse.dart';
import 'package:igameapp/src/data/models/gamesmodels/game_model.dart';
import 'local/local_data_source.dart';
import 'models/api_state.dart';
import 'models/base_api_response.dart';
import 'models/user/user.dart';
import 'remote/remote_data_source.dart';

class Repository extends BaseApiResponse {

  final RemoteDataSource _remoteDataSource;

  final LocalDataSource? _localDataSource;

  Repository(this._remoteDataSource, this._localDataSource);

  /* --------------------------------API METHODS------------------------------------- */

  //I Added to ways to call Api to show the differences between them here and in Controller and why I used Stream instead of Future.

  Future<BaseResponse<GameModel>> getGames(Map<String, dynamic> map) =>
      _remoteDataSource.getGames(map);

  Stream<ApiState<BaseResponse<GameModel>>> getGamesEasyWay(Map<String, dynamic> map) async * {
    yield ApiState.loading();
    yield await safeApiCall(() => _remoteDataSource.getGames(map));
  }

  /* --------------------------------Floor METHODS------------------------------------- */

  Future<List<GameEntity>>? getLocalGamesList() =>
      _localDataSource?.getGamesList();

  Future<void>? addGameItem(GameEntity task) =>
      _localDataSource?.addGameItem(task);
  Future<void>? addGames(List<GameEntity> games) =>
      _localDataSource?.addGameList(games);

  Future<void>? removeGames() =>
      _localDataSource?.removeGames();


  /* --------------------------------SHARED_PREFERENCES METHODS------------------------------------- */

  Future<Locale> get fetchLocale => _localDataSource!.fetchLocale;

  Future<User> getUser() => _localDataSource!.getUser();

  Future<void> saveUser(User user) => _localDataSource!.saveUser(user);

  Future<void> removeUser() => _localDataSource!.removeUser();

  Future<List<String>> get getSearchHistoryList =>
      _localDataSource!.getSearchHistoryList;

  Future<void> saveSearchQuery(String query) async => _localDataSource?.saveSearchQuery(query);


}
