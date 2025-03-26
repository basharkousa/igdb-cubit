import 'package:igameapp/src/core/data/local/datasources/sharedpref/shared_preference_helper.dart';
import 'package:igameapp/src/core/data/models/BaseResponse.dart';
import 'package:igameapp/src/core/data/remote/api/clients/dio_client.dart';
import 'package:igameapp/src/core/data/remote/constants/endpoints.dart';
import 'package:igameapp/src/features/game/data/local/floor/dao/game_dao.dart';
import 'package:igameapp/src/features/game/data/local/floor/dao/game_favorite_dao.dart';
import 'package:igameapp/src/features/game/data/local/floor/entity/game_entity.dart';
import 'package:igameapp/src/features/game/data/local/floor/entity/game_favorite_entity.dart';
import 'package:igameapp/src/features/game/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/features/game/domain/models/game.dart';
import 'package:igameapp/src/features/game/domain/repositories/i_game_repo.dart';

class GameRepo implements IGameRepo {
  final DioClient _dioClient;
  final GameDao _gameDao;
  final GameFavoriteDao _gameFavoriteDao;


  GameRepo(this._dioClient, this._gameDao,this._gameFavoriteDao);

  @override
  Future<BaseResponse<GameModel>> getGames(Map<String, dynamic> params) async {
    params["fields"] =
        "*,cover.*,screenshots.*,videos.*,genres.*,player_perspectives.*";
    final response =
        await _dioClient.get(Endpoints.games, queryParameters: params);
    return BaseResponse<GameModel>.fromJson(
        json: response, fromJsonMapper: GameModel.fromJson);
  }

  @override
  Future<List<GameEntity>> getLocalGames() async {
    return await _gameDao.findAllGames();
    // return games.map((gameEntity) => gameEntity.toGame()).toList();
  }

  @override
  Future<void> addGame(Game game) async =>
      _gameDao.insertGame(GameEntity.from(game));

  @override
  Future<void> addGames(List<GameModel> games) async => _gameDao.insertGames(
      games.map<GameEntity>((gameModel) => GameEntity.fromGameModel(gameModel)).toList());

  @override
  Future<void> removeGames() => _gameDao.deleteAllGames();

  @override
  Future<void> toggleFavouriteGame(Game game) async {
    if(game.isFavourite){
      _gameFavoriteDao.deleteFavoriteGame(GameFavoriteEntity.from(game));
    }else{
      _gameFavoriteDao.insertFavoriteGame(GameFavoriteEntity.from(game));
    }
    var games = await _gameFavoriteDao.findAllFavoriteGames();
    print("FavouriteGamesLength ${games.length}");
  }

  Future<bool> isGameFavorite(int gameId) async {
    final game = await _gameFavoriteDao.findGameById(gameId);
    return game != null;
  }



}
