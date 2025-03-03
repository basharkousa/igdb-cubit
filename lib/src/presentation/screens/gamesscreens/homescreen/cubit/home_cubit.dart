import 'package:igameapp/src/presentation/widgets/common/paginationcubit/base_pagination_cubit.dart';
import 'package:igameapp/src/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/data/repositories/game/game_repo.dart';
import 'package:igameapp/src/data/models/BaseResponse.dart';

class HomeCubit extends BasePaginationCubit<GameModel> {
  final GameRepo repository;

  HomeCubit(this.repository) : super() {
    // scrollController.addListener(_scrollListener);
    // getGames();
  }

  @override
  Future<BaseResponse<GameModel>> fetchInitialList() async {
    return repository.getGames({"limit": limit, "offset": 0});
  }

  @override
  Future<BaseResponse<GameModel>> fetchMoreList(int offset) async {
    return repository.getGames({"limit": limit, "offset": offset});
  }

  /*Future<void> getGames() async {
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
*/
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
    final localGames = await repository.getLocalGames();

    print("taskHistoryListLength ${localGames.length}");
    return localGames ?? [];
  }

  void clearGamesHistory() async {
   /* await repository.removeGames();
    var list = await getLocalGamesList();
    // emit(HomeError("Error", list));
    emit(ApiError("Error"));*/
  }
}
