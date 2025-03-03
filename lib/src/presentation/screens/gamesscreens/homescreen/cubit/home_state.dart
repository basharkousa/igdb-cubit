/*
part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final BaseResponse<GameModel> response;
  final List<GameModel> localGames;

  HomeSuccess(this.response,this.localGames);

}

class HomeError extends HomeState {
  final String? message;
  final List<GameModel>? localGames;

  HomeError({this.message, this.localGames});

  HomeError copyWith({
    String? message,
    List<GameModel>? localGames,
  }) {
    return HomeError(
      message: message ?? this.message,
      localGames: localGames ?? this.localGames,
    );
  }
}

class HomeLoadingMore extends HomeState {}

class HomeLoadMoreError extends HomeState {
  final String message;

  HomeLoadMoreError(this.message);

}
*/
