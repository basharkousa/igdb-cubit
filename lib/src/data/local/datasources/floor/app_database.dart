import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
import 'dao/game_dao.dart';
import 'entity/game_entity.dart';
part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [GameEntity])
abstract class AppDatabase extends FloorDatabase {
  GameDao get gameDao;
}
