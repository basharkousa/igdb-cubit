part of 'saved_games_cubit.dart';

@immutable
sealed class SavedGamesState {

  R when<R>({
    required R Function(List<Game> data) gamesLoaded,
    required R Function(String message) gameError,
    required R Function() gamesEmpty,
  });
}

class GamesLoaded extends SavedGamesState {
  final List<Game>? _games;

  GamesLoaded(this._games);

  GamesLoaded copyWith({
    List<Game>? games,
  }) {
    return GamesLoaded(
      games ?? _games,
    );
  }

  List<Game> get games => _games ?? [];

  @override
  R when<R>(
      {required R Function(List<Game> data) gamesLoaded,
      required R Function(String message) gameError,
      required R Function() gamesEmpty}) {
    return gamesLoaded(games);
  }
}

class GamesError extends SavedGamesState {
  final String _message;

  GamesError(this._message);

  String get message => _message;

  @override
  R when<R>(
      {required R Function(List<Game> data) gamesLoaded,
        required R Function(String message) gameError,
        required R Function() gamesEmpty}) {
    return gameError(message);
  }
}

class GamesEmpty extends SavedGamesState {
  GamesEmpty();

  @override
  R when<R>(
      {required R Function(List<Game> data) gamesLoaded,
        required R Function(String message) gameError,
        required R Function() gamesEmpty}) {
    return gamesEmpty();
  }
}
