import 'package:floor/floor.dart';
import 'package:igameapp/src/features/game/data/local/floor/entity/game_favorite_entity.dart';

@dao
abstract class GameFavoriteDao {

  @Query('SELECT * FROM GameFavoriteEntity')
  Future<List<GameFavoriteEntity>> findAllFavoriteGames();

  @Query('SELECT * FROM GameFavoriteEntity')
  Stream<List<GameFavoriteEntity>> findAllFavoriteAsStream();

  @Query('SELECT * FROM GameFavoriteEntity WHERE id = :id')
  Future<GameFavoriteEntity?> findGameById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertFavoriteGame(GameFavoriteEntity game);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertFavoriteGames(List<GameFavoriteEntity> games);

  @delete
  Future<void> deleteFavoriteGame(GameFavoriteEntity gameEntity);


  @Query('DELETE FROM GameFavoriteEntity')
  Future<void> deleteFavoriteAllGames();

}