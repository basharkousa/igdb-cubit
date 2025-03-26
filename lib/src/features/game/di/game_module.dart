import 'package:igameapp/src/core/configs/navigation/route_setting.dart';
import 'package:igameapp/src/core/data/local/datasources/floor/app_database.dart';
import 'package:igameapp/src/core/data/remote/api/clients/dio_client.dart';
import 'package:igameapp/src/features/game/data/game_repo.dart';
import 'package:igameapp/src/features/game/data/local/floor/dao/game_dao.dart';
import 'package:igameapp/src/features/game/data/local/floor/dao/game_favorite_dao.dart';
import 'package:igameapp/src/features/game/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/features/game/domain/games_no_connection_usecase.dart';
import 'package:igameapp/src/features/game/domain/get_games_usecase.dart';
import 'package:igameapp/src/features/game/domain/models/game.dart';
import 'package:igameapp/src/features/game/domain/toggle_favourite_usecase.dart';
import 'package:igameapp/src/features/game/presentation/screens/gamedetailsscreen/cubit/game_details_cubit.dart';
import 'package:igameapp/src/features/game/presentation/screens/gamesscreen/cubit/games_cubit.dart';
import 'package:injectable/injectable.dart';

@module
abstract class GameModule {
  @lazySingleton
  GameDao gameDao(AppDatabase database) => database.gameDao;

  @lazySingleton
  GameFavoriteDao gameFavoriteDao(AppDatabase database) => database.gameFavoriteDao;

  @lazySingleton
  GameRepo gameRepo(
          DioClient dioClient, GameDao gameDao, GameFavoriteDao favouriteDao) =>
      GameRepo(dioClient, gameDao, favouriteDao);

  @lazySingleton
  GamesCubit gamesCubit(GamesNoConnectionUseCase getGamesNoConnectUseCase,
          GetGamesUseCase getGamesUseCase,
          ToggleFavouriteUseCase toggleUseCase
      ) =>
      GamesCubit(getGamesNoConnectUseCase, getGamesUseCase,toggleUseCase);

  @injectable
  GameDetailsCubit gameDetailsCubit(
          GameRepo repository, RouteSettingsService routeSettingService) =>
      GameDetailsCubit(repository,
          routeSettingService.currentRouteSettings?.arguments as Game);
}
