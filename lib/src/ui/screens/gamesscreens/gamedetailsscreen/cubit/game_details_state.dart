part of 'game_details_cubit.dart';

@immutable
abstract class GameDetailsState {}

class GameDetailsInitial extends GameDetailsState {
  final GameModel? game;
  GameDetailsInitial(this.game);
}
