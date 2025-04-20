import 'package:igameapp/src/features/game/data/game_repo.dart';
import 'package:igameapp/src/features/game/domain/models/game.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLocalStreamGamesUseCase{

  final GameRepo _gameRepo;

  GetLocalStreamGamesUseCase(this._gameRepo);

  Stream<List<Game>> call() => _gameRepo.getLocalStreamGames();

}