import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:igameapp/src/features/game/domain/get_local_stream_games.dart';
import 'package:igameapp/src/features/game/domain/models/game.dart';
import 'package:igameapp/src/features/game/domain/toggle_favourite_usecase.dart';

part 'saved_games_state.dart';

class SavedGamesCubit extends Cubit<SavedGamesState> {
  final GetLocalStreamGamesUseCase _getLocalStreamGamesUseCase;
  final ToggleFavouriteUseCase _toggleFavouriteUseCase;

  StreamSubscription<List<Game>>? _favouriteStreamSubscription ;

  SavedGamesCubit(this._getLocalStreamGamesUseCase,this._toggleFavouriteUseCase) : super(GamesLoaded([])) {
    _watchFavorites();
  }

  void watchLocalGames() {
    _getLocalStreamGamesUseCase().listen((data) {
      emit(GamesLoaded(data));
    });
  }

  void _watchFavorites() {
    _favouriteStreamSubscription?.cancel(); // Cancel previous subscription
    _favouriteStreamSubscription = _getLocalStreamGamesUseCase().listen(
      (games) {
        print("Cubit${games.length} ${games.isEmpty}");
        return games.isEmpty ? emit(GamesEmpty()) : emit(GamesLoaded(games));
      },
      onError: (error) => emit(GamesError('Failed to load favorites ($error)')),
    );
  }

  void toggleFavouriteState(Game game) {
    final updatedGames = (state as GamesLoaded).games.map((item) {
      if (item.id == game.id) {
        return item.copyWith(isFavourite: !item.isFavourite);
      }
      return item;
    }).toList();
    emit(GamesLoaded(updatedGames));
    _toggleFavouriteUseCase(game);
  }


  @override
  Future<void> close() {
    _favouriteStreamSubscription?.cancel();
    return super.close();
  }

  Future<void> onRefresh() async {
    _watchFavorites();
  }
}
