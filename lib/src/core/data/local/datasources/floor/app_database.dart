import 'package:floor/floor.dart';
import 'package:igameapp/src/features/game/data/local/floor/dao/game_dao.dart';
import 'package:igameapp/src/features/game/data/local/floor/dao/game_favorite_dao.dart';
import 'package:igameapp/src/features/game/data/local/floor/entity/game_entity.dart';
import 'package:igameapp/src/features/game/data/local/floor/entity/game_favorite_entity.dart';
import 'package:igameapp/src/features/game/data/local/floor/string_list_convertor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
// import 'entity/game_entity.dart';
part 'app_database.g.dart'; // the generated code will be there

@TypeConverters([StringListConverter])
@Database(version: 2, entities: [GameEntity,GameFavoriteEntity])
abstract class AppDatabase extends FloorDatabase {
  GameDao get gameDao;
  GameFavoriteDao get gameFavoriteDao;

}
