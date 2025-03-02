import 'package:igameapp/src/data/models/BaseResponse.dart';
import 'package:igameapp/src/data/models/gamesmodels/game_model.dart';

abstract class IGameRepo{
  Future<BaseResponse<GameModel>> getGames(Map<String,dynamic> params);
  Future<List<GameModel>> getLocalGames();
  Future<void> addGame(GameModel game);
  Future<void> addGames(List<GameModel> games);
  Future<void> removeGames();
}