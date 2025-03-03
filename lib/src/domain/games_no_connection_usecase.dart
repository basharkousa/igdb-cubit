import 'package:igameapp/src/data/models/BaseResponse.dart';
import 'package:igameapp/src/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/data/repositories/game/game_repo.dart';
import 'package:igameapp/src/domain/remove_local_games_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class GamesNoConnectionUseCase {
  final GameRepo _gameRep;
  final RemoveLocalGamesUseCase _removeLocalGamesUseCase;

  GamesNoConnectionUseCase(this._gameRep,this._removeLocalGamesUseCase);

  Future<BaseResponse<GameModel>> call(Map<String,dynamic> map) async {
    BaseResponse<GameModel> games;
    try {
      var response = await _gameRep.getGames(map);
      games = response;
      _removeLocalGamesUseCase();
      _gameRep.addGames(games.list??[]);
      return games;
    } catch (e, t) {
      var localGames = await _gameRep.getLocalGames();
      games = BaseResponse(list: localGames??[]);
      return games;
    }
  }
}
