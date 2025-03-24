import 'package:igameapp/src/features/game/data/game_repo.dart';
import 'package:igameapp/src/features/game/domain/models/game.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetGamesUseCase {
  final GameRepo _gameRepo;

  GetGamesUseCase(this._gameRepo);

  Future<List<Game>> call(Map<String, dynamic> map) async {
    // return await _gameRepo.getGames(map).then((gamesResponse) =>
    // gamesResponse.list?.map((element) => element.toGame()).toList() ?? []);

    return await _gameRepo.getGames(map).then((gamesResponse) => Future.wait(
        gamesResponse.list
                ?.map((element) async => element
                    .toGame(await _gameRepo.isGameFavorite(element.id ?? 0)))
                .toList() ??
            []));
  }
}
