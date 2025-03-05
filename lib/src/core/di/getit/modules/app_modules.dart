import 'package:igameapp/src/core/configs/navigation/route_setting.dart';
import 'package:igameapp/src/appcubit/app_cubit.dart';
import 'package:igameapp/src/core/data/local/datasources/floor/dao/game_dao.dart';
import 'package:igameapp/src/core/data/local/datasources/sharedpref/shared_preference_helper.dart';
import 'package:igameapp/src/core/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/core/data/remote/api/clients/dio_client.dart';
import 'package:igameapp/src/core/data/repositories/app/app_repo.dart';
import 'package:igameapp/src/core/data/repositories/game/game_repo.dart';
import 'package:igameapp/src/core/domain/games_no_connection_usecase.dart';
import 'package:igameapp/src/core/domain/remove_local_games_usecase.dart';
import 'package:igameapp/src/core/domain/repositories/i_game_repo.dart';
import 'package:igameapp/src/core/presentation/screens/gamesscreens/gamedetailsscreen/cubit/game_details_cubit.dart';
import 'package:igameapp/src/core/presentation/screens/gamesscreens/homescreen/cubit/home_cubit.dart';
import 'package:igameapp/src/core/presentation/screens/getstartedscreens/splashscreen/cubit/splash_cubit.dart';
import 'package:igameapp/src/core/presentation/screens/settingscreen/cubit/settings_cubit.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @lazySingleton
  RouteSettingsService get routeSettingsService;

  @lazySingleton
  AppRepo appRepository(SharedPreferenceHelper sharedPreferenceHelper) =>
      AppRepo(sharedPreferenceHelper);

  @lazySingleton
  AppCubit appCubit(AppRepo appRepo) => AppCubit(appRepo);

  @injectable
  SplashCubit splashCubit(AppRepo repository) => SplashCubit(repository);

  @lazySingleton
  IGameRepo gameRepo(DioClient dioClient, GameDao gameDao) =>
      GameRepo(dioClient, gameDao);

  @lazySingleton
  HomeCubit homeCubit(GameRepo repository, GamesNoConnectionUseCase useCase) =>
      HomeCubit(repository, useCase);

  @injectable
  GameDetailsCubit gameDetailsCubit(
          GameRepo repository, RouteSettingsService routeSettingService) =>
      GameDetailsCubit(repository,
          routeSettingService.currentRouteSettings?.arguments as GameModel);

  @injectable
  SettingsCubit settingsCubit(
          AppRepo repository, RemoveLocalGamesUseCase useCase) =>
      SettingsCubit(repository, useCase);
}
