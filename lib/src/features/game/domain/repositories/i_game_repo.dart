import 'package:igameapp/src/core/data/models/BaseResponse.dart';
import 'package:igameapp/src/features/game/data/local/floor/entity/game_entity.dart';
import 'package:igameapp/src/features/game/data/local/floor/entity/game_favorite_entity.dart';
import 'package:igameapp/src/features/game/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/features/game/domain/models/game.dart';

abstract class IGameRepo{
  Future<BaseResponse<GameModel>> getGames(Map<String,dynamic> params);
  Future<List<GameEntity>> getLocalGames();
  Stream<List<Game>> getLocalStreamGames();
  Future<void> addGame(Game game);
  Future<void> toggleFavouriteGame(Game game);
  Future<void> addGames(List<GameModel> games);
  Future<void> removeGames();
  Future<bool> isGameFavorite(int gameId);
}