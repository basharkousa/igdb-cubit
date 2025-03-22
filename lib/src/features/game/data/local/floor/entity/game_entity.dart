import 'dart:math';
import 'package:floor/floor.dart';
import 'package:igameapp/src/features/game/data/local/floor/string_list_convertor.dart';
import 'package:igameapp/src/features/game/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/features/game/domain/models/cover.dart';
import 'package:igameapp/src/features/game/domain/models/game.dart';
import 'package:igameapp/src/features/game/domain/models/screen_shot.dart';

@entity
class GameEntity {
  @primaryKey
  final int id;
  final String name;
  final double rating;
  final String imgUrl;
  final bool isFavourite;
  final String summery;

  @TypeConverters([StringListConverter])
  final List<String> screenshots;

  GameEntity(
      {required this.id,
      this.name = "Name",
      this.imgUrl = "",
      this.rating = 0.0,
      this.isFavourite = false,
      this.summery = "",
      this.screenshots = const []});

  static from(Game gameModel) {
    return GameEntity(
      id: gameModel.id ?? Random().nextInt(10),
      name: gameModel.name ?? "name",
      imgUrl: gameModel.coverBig ?? "",
      rating: gameModel.ratings ?? 0.0,
      isFavourite: gameModel.isFavourite,
    );
  }

  static fromGameModel(GameModel gameModel) {
    return GameEntity(
      id: gameModel.id ?? Random().nextInt(10),
      name: gameModel.name ?? "name",
      imgUrl:"https://images.igdb.com/igdb/image/upload/t_cover_big/${gameModel.cover?.imageId}.jpg",
      rating: gameModel.rating ?? 0.0,
      isFavourite: false,
    );
  }


  Game toGame() {
    return Game(
        id: id,
        name: name,
        cover: Cover(url: imgUrl, imageId: imgUrl),
        ratings: rating,
        isFavourite: isFavourite,
        screenshots: screenshots
            .map((item) => ScreenShot(gameId: 0, link: item))
            .toList(),
        summary: summery);
  }
}
