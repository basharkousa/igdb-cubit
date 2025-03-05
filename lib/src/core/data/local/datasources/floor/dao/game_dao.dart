import 'package:floor/floor.dart';
import 'package:igameapp/src/core/data/local/datasources/floor/entity/game_entity.dart';

@dao
abstract class GameDao {
  @Query('SELECT * FROM GameEntity')
  Future<List<GameEntity>> findAllGames();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertGame(GameEntity person);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertGames(List<GameEntity> games);

  @Query('DELETE * FROM GameEntity')
  Future<void> removeGames();

  @Query('DELETE FROM GameEntity')
  Future<void> deleteAllGames();

}