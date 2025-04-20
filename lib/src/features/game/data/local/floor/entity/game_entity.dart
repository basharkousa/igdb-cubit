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
  final String summery;

  @TypeConverters([StringListConverter])
  final List<String> screenshots;

  GameEntity(
      {required this.id,
      this.name = "Name",
      this.imgUrl = "",
      this.rating = 0.0,
      this.summery = "",
      this.screenshots = const []});

  static from(Game game) {
    return GameEntity(
      id: game.id ?? Random().nextInt(10),
      name: game.name ?? "name",
      imgUrl: game.coverBig ?? "",
      rating: game.ratings ?? 0.0,
      screenshots: game.screenshots?.map((element)=> element.link??'').toList()??[]
    );
  }

  static fromGameModel(GameModel gameModel) {
    return GameEntity(
      id: gameModel.id ?? Random().nextInt(10),
      summery: gameModel.summary??'',
      name: gameModel.name ?? "name",
      imgUrl:"https://images.igdb.com/igdb/image/upload/t_cover_big/${gameModel.cover?.imageId}.jpg",
      rating: gameModel.rating ?? 0.0,
      // screenshots: gameModel.screenshots?.map((element)=> element.url??'').toList()??[]
      screenshots: gameModel.screenshots?.map((element)=> "https://images.igdb.com/igdb/image/upload/t_screenshot_big/${element.imageId}.jpg").toList()??[]
    );
  }


  Game toGame(bool isFavourite) {
    return Game(
        id: id,
        name: name,
        cover: Cover(url: imgUrl, imageId: imgUrl),
        ratings: rating,
        isFavourite: isFavourite,
        screenshots: screenshots
            .map((item) => ScreenShot(imageId: "0", link: item))
            .toList(),
        summary: summery);
  }
}
