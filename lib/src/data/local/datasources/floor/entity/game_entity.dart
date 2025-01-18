import 'dart:math';

import 'package:floor/floor.dart';
import 'package:igameapp/src/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/data/models/gamesmodels/subclasses/cover_model.dart';

@entity
class GameEntity {
  @primaryKey
  final int id;
  final String name;
  final double rating;
  final String imgUrl;

  GameEntity(
      {required this.id,
      this.name = "Name",
      this.imgUrl = "",
      this.rating = 0.0});

  static from(GameModel gameModel) {
    return GameEntity(
        id: gameModel.id ?? Random().nextInt(10),
        name: gameModel.name ?? "name",
        imgUrl: gameModel.cover?.url ?? "",
        rating: gameModel.rating ?? 0.0);
  }

  GameModel toGameModel(){
    return GameModel(
      id: id,
      name: name,
      cover: CoverModel(url: imgUrl),
      rating: rating
    );
  }

}
