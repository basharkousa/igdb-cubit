import 'package:igameapp/src/core/data/models/BaseResponse.dart';
import 'package:igameapp/src/features/game/data/game_repo.dart';
import 'package:igameapp/src/features/game/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/features/game/domain/models/game.dart';
import 'package:igameapp/src/features/game/domain/remove_local_games_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class GamesNoConnectionUseCase {
  final GameRepo _gameRep;
  final RemoveLocalGamesUseCase _removeLocalGamesUseCase;

  GamesNoConnectionUseCase(this._gameRep, this._removeLocalGamesUseCase);

  Future<List<Game>> call(Map<String, dynamic> map) async {
    try {
      var response = await _gameRep.getGames(map);
      BaseResponse<GameModel> games = response;
      _removeLocalGamesUseCase();
      _gameRep.addGames(games.list ?? []);

      return Future.wait(games.list
              ?.map((element) async => element
                  .toGame(await _gameRep.isGameFavorite(element.id ?? 0)))
              .toList() ??
          []);
    } catch (e, t) {
      var localGames = await _gameRep.getLocalGames();
      return Future.wait(localGames
          .map((element) async =>
              element.toGame(await _gameRep.isGameFavorite(element.id ?? 0)))
          .toList());
    }
  }
}
