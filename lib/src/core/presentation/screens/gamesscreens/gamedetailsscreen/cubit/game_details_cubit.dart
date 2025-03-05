import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:igameapp/src/core/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/core/data/repositories/game/game_repo.dart';

part 'game_details_state.dart';

class GameDetailsCubit extends Cubit<GameDetailsState> {
  final GameRepo repository;
  GameModel? gameModel;

  GameDetailsCubit(this.repository, this.gameModel)
      : super(GameDetailsInitial(gameModel));
}
