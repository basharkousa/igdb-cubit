import 'package:igameapp/src/core/presentation/widgets/common/paginationcubit/api_state_paging.dart';
import 'package:igameapp/src/core/presentation/widgets/common/paginationcubit/base_pagination_cubit.dart';
import 'package:igameapp/src/features/game/domain/games_no_connection_usecase.dart';
import 'package:igameapp/src/features/game/domain/get_games_usecase.dart';
import 'package:igameapp/src/features/game/domain/models/game.dart';

class GamesCubit extends BasePaginationCubit<Game> {
  final GamesNoConnectionUseCase gamesNoConnectionUseCase;
  final GetGamesUseCase getGamesUseCase;

  GamesCubit(this.gamesNoConnectionUseCase,this.getGamesUseCase) : super() {
    // scrollController.addListener(_scrollListener);
    // getGames();
  }

  @override
  Future<List<Game>> fetchInitialList() async {
    return await gamesNoConnectionUseCase({"limit": limit, "offset": 0});
  }

  @override
  Future<List<Game>> fetchMoreList(int offset) async {
    return await getGamesUseCase({"limit": limit, "offset": offset});
    // return await repository.getGames({"limit": limit, "offset": offset}).then(
    //     (value) =>
    //         value.list?.map((element) => element.toGame()).toList() ?? []);
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



  void clearGamesHistory() async {
    /* await repository.removeGames();
    var list = await getLocalGamesList();
    // emit(HomeError("Error", list));
    emit(ApiError("Error"));*/
  }

  void toggleFavouriteState(Game game) {
    final updatedGames = state.data?.map((item) {
      if (item.id == game.id) {
        return item.copyWith(isFavourite: !item.isFavourite);
      }
      return item;
    }).toList();
    emit(ApiCompleted(updatedGames));

    // emit(ApiCompleted(state.data));
    // var newState = !game.isFavourite;

    //1usecase
    //if selected Remove it
    //if not Add it
    //2uscase
    //switch
  }
}
