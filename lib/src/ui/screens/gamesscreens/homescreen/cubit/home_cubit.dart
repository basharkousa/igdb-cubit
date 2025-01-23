import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igameapp/src/data/local/datasources/floor/entity/game_entity.dart';
import 'package:igameapp/src/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/data/remote/exceptions/dio_error_util.dart';
import 'package:igameapp/src/data/repository.dart';
import 'package:igameapp/src/data/models/BaseResponse.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final Repository repository;

  HomeCubit(this.repository) : super(HomeInitial()) {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        print("End scrolling");
        loadMore();
      }
    });
    getGames();
  }

  ScrollController scrollController = ScrollController();
  int limit = 8;
  int offset = 0;
  bool isLoading = false;
  BaseResponse<GameModel> gamesList = BaseResponse<GameModel>();

  Future<void> getGames() async {
    emit(HomeLoading());
    gamesList = BaseResponse<GameModel>();
    offset = 0;
    try {
      BaseResponse<GameModel> gamesListResponse =
          await repository.getGames({"limit": limit, "offset": offset});
      final currentState = state;

      List<GameEntity> localGames = [];
      for (var game in gamesListResponse.list ?? []) {
        localGames.add(GameEntity.from(game));
        await repository.addGames(localGames);
      }
      await repository.removeGames();
      await repository.addGames(localGames);
      gamesList = gamesListResponse;
      emit(HomeSuccess(gamesList,
          localGames.map((entity) => entity.toGameModel()).toList()));
    } on DioException catch (error) {
      var list = await getLocalGamesList();
      emit(HomeError(DioErrorUtil.handleError(error) ?? "Error", list));
    } catch (error) {
      var list = await getLocalGamesList();
      emit(HomeError(error.toString(), list));
    }
  }

  Future<void> loadMore() async {
    if (gamesList.list?.isNotEmpty ?? false) {
      if (!isLoading) {
        emit(HomeLoadingMore());
        offset += limit;
        isLoading = true;
        try {
          BaseResponse<GameModel> gamesListResponse =
              await repository.getGames({"limit": limit, "offset": offset});
          final currentState = state;
          // if (currentState is HomeSuccess) {
          gamesList.list!.addAll(gamesListResponse.list!);
          emit(HomeSuccess(gamesList, []));
          // }
        } on DioException catch (error) {
          offset = offset - limit;
          isLoading = false;
          emit(HomeLoadMoreError(
              DioErrorUtil.handleError(error) ?? "LoadMoreError"));
        } catch (error) {
          offset = offset - limit;
          isLoading = false;
          emit(HomeLoadMoreError(error.toString()));
        } finally {
          isLoading = false;
        }
      }
    }
  }

  /*void getGames() async {
    emit(HomeLoading());
    try {
      final map = {"": ""};
      final response = await repository.getGames(map);
      final List<GameEntity> listGameEntities = [];
      for (var game in response.list ?? []) {
        listGameEntities.add(GameEntity.from(game));
      }
      await repository.removeGames();
      await repository.addGames(listGameEntities);

      emit(HomeSuccess(response,
          listGameEntities.map((entity) => entity.toGameModel()).toList()));

    } on DioException catch (error) {
      var list = await getLocalGamesList();
      emit(HomeError(DioErrorUtil.handleError(error) ?? "Error", list));
    } catch (error) {
      var list = await getLocalGamesList();
      emit(HomeError(error.toString(), list));
    }
  }*/

  Future<List<GameModel>> getLocalGamesList() async {
    final localGamesEntities = await repository.getLocalGamesList();
    final localGames =
        localGamesEntities?.map((entity) => entity.toGameModel()).toList();
    print("taskHistoryListLength ${localGamesEntities?.length}");
    return localGames ?? [];
  }

  Future<void> onRefresh() async {
    getGames();
    getLocalGamesList();
  }

  void clearGamesHistory() async {
    await repository.removeGames();
    var list = await getLocalGamesList();
    emit(HomeError("Error", list));
  }
}
