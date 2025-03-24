import 'package:igameapp/src/features/game/data/game_repo.dart';
import 'package:igameapp/src/features/game/domain/models/game.dart';
import 'package:injectable/injectable.dart';

@injectable
class ToggleFavouriteUseCase{

  final GameRepo _gameRepo;

  const ToggleFavouriteUseCase(this._gameRepo);

  Future<void> call(Game game) async {
    _gameRepo.toggleFavouriteGame(game);
  }


}