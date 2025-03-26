part of 'game_details_cubit.dart';

@immutable
sealed class GameDetailsState {}

class GameDetailsInitial extends GameDetailsState {
  final Game? game;
  final TextEditingController? textEditingController;
  GameDetailsInitial({this.game, this.textEditingController});

  GameDetailsInitial copyWith({
    Game? game,
    TextEditingController? textEditingController,
  }) {
    return GameDetailsInitial(
      game: game ?? this.game,
      textEditingController:
          textEditingController ?? this.textEditingController,
    );
  }
}

class GameDetailLoading extends GameDetailsState{
  GameDetailLoading(): super();
}
