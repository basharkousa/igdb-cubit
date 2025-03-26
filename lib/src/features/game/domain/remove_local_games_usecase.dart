import 'package:igameapp/src/features/game/data/game_repo.dart';
import 'package:injectable/injectable.dart';

//Useless use case because there's no business logic inside it.

@injectable
class RemoveLocalGamesUseCase {
  final GameRepo _gameRepo;

  const RemoveLocalGamesUseCase(this._gameRepo);

  Future<void> call() => _gameRepo.removeGames();
}
