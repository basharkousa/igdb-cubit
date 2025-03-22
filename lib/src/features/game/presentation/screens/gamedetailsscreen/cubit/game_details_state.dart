part of 'game_details_cubit.dart';

@immutable
sealed class GameDetailsState {}

class GameDetailsInitial extends GameDetailsState {
  final GameModel? game;
  GameDetailsInitial(this.game);
}

class GameDetailLoading extends GameDetailsState{
  GameDetailLoading(): super();
}
