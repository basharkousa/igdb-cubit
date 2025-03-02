import 'package:igameapp/src/configs/navigation/route_setting.dart';
import 'package:igameapp/src/appcubit/app_cubit.dart';
import 'package:igameapp/src/data/local/datasources/floor/dao/game_dao.dart';
import 'package:igameapp/src/data/local/datasources/sharedpref/shared_preference_helper.dart';
import 'package:igameapp/src/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/data/remote/api/clients/dio_client.dart';
import 'package:igameapp/src/data/repositories/app/app_repo.dart';
import 'package:igameapp/src/data/repositories/game/game_repo.dart';
import 'package:igameapp/src/presentation/screens/gamesscreens/gamedetailsscreen/cubit/game_details_cubit.dart';
import 'package:igameapp/src/presentation/screens/gamesscreens/homescreen/cubit/home_cubit.dart';
import 'package:igameapp/src/presentation/screens/getstartedscreens/splashscreen/cubit/splash_cubit.dart';
import 'package:igameapp/src/presentation/screens/settingscreen/cubit/settings_cubit.dart';
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
  GameRepo gameRepo(DioClient dioClient, GameDao gameDao) =>
      GameRepo(dioClient, gameDao);

  @lazySingleton
  HomeCubit homeCubit(GameRepo repository) => HomeCubit(repository);

  @injectable
  GameDetailsCubit gameDetailsCubit(
          GameRepo repository, RouteSettingsService routeSettingService) =>
      GameDetailsCubit(repository,
          routeSettingService.currentRouteSettings?.arguments as GameModel);

  @injectable
  SettingsCubit settingsCubit(AppRepo repository) => SettingsCubit(repository);
}
