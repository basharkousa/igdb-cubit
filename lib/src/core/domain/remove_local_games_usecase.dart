import 'package:igameapp/src/core/data/repositories/game/game_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveLocalGamesUseCase {
  final GameRepo _gameRepo;

  const RemoveLocalGamesUseCase(this._gameRepo);

  Future<void> call() => _gameRepo.removeGames();
}
