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
    // Call getGames() here to fetch data initially
    getGames();
  }

  void getGames() async {
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
  }

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
