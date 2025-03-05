import 'package:igameapp/src/core/data/local/datasources/floor/dao/game_dao.dart';
import 'package:igameapp/src/core/data/local/datasources/floor/entity/game_entity.dart';
import 'package:igameapp/src/core/data/models/BaseResponse.dart';
import 'package:igameapp/src/core/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/core/data/remote/api/clients/dio_client.dart';
import 'package:igameapp/src/core/data/remote/constants/endpoints.dart';
import 'package:igameapp/src/core/domain/repositories/i_game_repo.dart';

class GameRepo implements IGameRepo {
  final DioClient _dioClient;
  final GameDao _gameDao;

  GameRepo(this._dioClient, this._gameDao);

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
  Future<List<GameModel>> getLocalGames() async {
    final games = await _gameDao.findAllGames();
    return games.map((gameEntity) => gameEntity.toGameModel()).toList();
  }

  @override
  Future<void> addGame(GameModel game) async =>
      _gameDao.insertGame(GameEntity.from(game));

  @override
  Future<void> addGames(List<GameModel> games) async => _gameDao.insertGames(
      games.map<GameEntity>((game) => GameEntity.from(game)).toList());

  @override
  Future<void> removeGames() => _gameDao.deleteAllGames();

}
