import 'dart:math';

import 'package:floor/floor.dart';
import 'package:igameapp/src/features/game/data/local/floor/string_list_convertor.dart';
import 'package:igameapp/src/features/game/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/features/game/domain/models/cover.dart';
import 'package:igameapp/src/features/game/domain/models/game.dart';
import 'package:igameapp/src/features/game/domain/models/screen_shot.dart';

@entity
class GameFavoriteEntity {
  @primaryKey
  final int id;
  final String name;
  final double rating;
  final String imgUrl;
  final bool isFavourite;
  final String summery;

  @TypeConverters([StringListConverter])
  final List<String> screenshots;

  GameFavoriteEntity(
      {required this.id,
        this.name = "Name",
        this.imgUrl = "",
        this.rating = 0.0,
        this.isFavourite = false,
        this.summery = "",
        this.screenshots = const []});

  static from(Game game) {
    return GameFavoriteEntity(
      id: game.id ?? Random().nextInt(10),
      name: game.name ?? "name",
      summery: game.summary??"",
      imgUrl: game.coverBig ?? "",
      rating: game.ratings ?? 0.0,
      isFavourite: game.isFavourite,
      screenshots: game.screenshots?.map((element)=> "${element.link}").toList()??[]
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
            .map((item) => ScreenShot(imageId: "0", link: item))
            .toList(),
        summary: summery);
  }
}
