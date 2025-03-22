import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igameapp/src/features/game/data/game_repo.dart';
import 'package:igameapp/src/features/game/data/models/gamesmodels/game_model.dart';


part 'game_details_state.dart';

class GameDetailsCubit extends Cubit<GameDetailsState> {
  final GameRepo repository;
  GameModel? gameModel;

  GameDetailsCubit(this.repository, this.gameModel)
      : super(GameDetailsInitial(gameModel));
}
