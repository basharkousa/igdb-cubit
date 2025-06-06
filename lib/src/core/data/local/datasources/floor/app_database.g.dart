// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  GameDao? _gameDaoInstance;

  GameFavoriteDao? _gameFavoriteDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `GameEntity` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `rating` REAL NOT NULL, `imgUrl` TEXT NOT NULL, `summery` TEXT NOT NULL, `screenshots` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `GameFavoriteEntity` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `rating` REAL NOT NULL, `imgUrl` TEXT NOT NULL, `isFavourite` INTEGER NOT NULL, `summery` TEXT NOT NULL, `screenshots` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  GameDao get gameDao {
    return _gameDaoInstance ??= _$GameDao(database, changeListener);
  }

  @override
  GameFavoriteDao get gameFavoriteDao {
    return _gameFavoriteDaoInstance ??=
        _$GameFavoriteDao(database, changeListener);
  }
}

class _$GameDao extends GameDao {
  _$GameDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _gameEntityInsertionAdapter = InsertionAdapter(
            database,
            'GameEntity',
            (GameEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'rating': item.rating,
                  'imgUrl': item.imgUrl,
                  'summery': item.summery,
                  'screenshots': _stringListConverter.encode(item.screenshots)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<GameEntity> _gameEntityInsertionAdapter;

  @override
  Future<List<GameEntity>> findAllGames() async {
    return _queryAdapter.queryList('SELECT * FROM GameEntity',
        mapper: (Map<String, Object?> row) => GameEntity(
            id: row['id'] as int,
            name: row['name'] as String,
            imgUrl: row['imgUrl'] as String,
            rating: row['rating'] as double,
            summery: row['summery'] as String,
            screenshots:
                _stringListConverter.decode(row['screenshots'] as String)));
  }

  @override
  Future<void> removeGames() async {
    await _queryAdapter.queryNoReturn('DELETE * FROM GameEntity');
  }

  @override
  Future<void> deleteAllGames() async {
    await _queryAdapter.queryNoReturn('DELETE FROM GameEntity');
  }

  @override
  Future<void> insertGame(GameEntity person) async {
    await _gameEntityInsertionAdapter.insert(
        person, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertGames(List<GameEntity> games) async {
    await _gameEntityInsertionAdapter.insertList(
        games, OnConflictStrategy.replace);
  }
}

class _$GameFavoriteDao extends GameFavoriteDao {
  _$GameFavoriteDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _gameFavoriteEntityInsertionAdapter = InsertionAdapter(
            database,
            'GameFavoriteEntity',
            (GameFavoriteEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'rating': item.rating,
                  'imgUrl': item.imgUrl,
                  'isFavourite': item.isFavourite ? 1 : 0,
                  'summery': item.summery,
                  'screenshots': _stringListConverter.encode(item.screenshots)
                },
            changeListener),
        _gameFavoriteEntityDeletionAdapter = DeletionAdapter(
            database,
            'GameFavoriteEntity',
            ['id'],
            (GameFavoriteEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'rating': item.rating,
                  'imgUrl': item.imgUrl,
                  'isFavourite': item.isFavourite ? 1 : 0,
                  'summery': item.summery,
                  'screenshots': _stringListConverter.encode(item.screenshots)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<GameFavoriteEntity>
      _gameFavoriteEntityInsertionAdapter;

  final DeletionAdapter<GameFavoriteEntity> _gameFavoriteEntityDeletionAdapter;

  @override
  Future<List<GameFavoriteEntity>> findAllFavoriteGames() async {
    return _queryAdapter.queryList('SELECT * FROM GameFavoriteEntity',
        mapper: (Map<String, Object?> row) => GameFavoriteEntity(
            id: row['id'] as int,
            name: row['name'] as String,
            imgUrl: row['imgUrl'] as String,
            rating: row['rating'] as double,
            isFavourite: (row['isFavourite'] as int) != 0,
            summery: row['summery'] as String,
            screenshots:
                _stringListConverter.decode(row['screenshots'] as String)));
  }

  @override
  Stream<List<GameFavoriteEntity>> findAllFavoriteAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM GameFavoriteEntity',
        mapper: (Map<String, Object?> row) => GameFavoriteEntity(
            id: row['id'] as int,
            name: row['name'] as String,
            imgUrl: row['imgUrl'] as String,
            rating: row['rating'] as double,
            isFavourite: (row['isFavourite'] as int) != 0,
            summery: row['summery'] as String,
            screenshots:
                _stringListConverter.decode(row['screenshots'] as String)),
        queryableName: 'GameFavoriteEntity',
        isView: false);
  }

  @override
  Future<GameFavoriteEntity?> findGameById(int id) async {
    return _queryAdapter.query('SELECT * FROM GameFavoriteEntity WHERE id = ?1',
        mapper: (Map<String, Object?> row) => GameFavoriteEntity(
            id: row['id'] as int,
            name: row['name'] as String,
            imgUrl: row['imgUrl'] as String,
            rating: row['rating'] as double,
            isFavourite: (row['isFavourite'] as int) != 0,
            summery: row['summery'] as String,
            screenshots:
                _stringListConverter.decode(row['screenshots'] as String)),
        arguments: [id]);
  }

  @override
  Future<void> deleteFavoriteAllGames() async {
    await _queryAdapter.queryNoReturn('DELETE FROM GameFavoriteEntity');
  }

  @override
  Future<void> insertFavoriteGame(GameFavoriteEntity game) async {
    await _gameFavoriteEntityInsertionAdapter.insert(
        game, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertFavoriteGames(List<GameFavoriteEntity> games) async {
    await _gameFavoriteEntityInsertionAdapter.insertList(
        games, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteFavoriteGame(GameFavoriteEntity gameEntity) async {
    await _gameFavoriteEntityDeletionAdapter.delete(gameEntity);
  }
}

// ignore_for_file: unused_element
final _stringListConverter = StringListConverter();
