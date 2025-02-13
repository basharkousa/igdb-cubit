import 'package:igameapp/src/configs/navigation/route_setting.dart';
import 'package:igameapp/src/controllers/app_controller.dart';
import 'package:igameapp/src/data/local/local_data_source.dart';
import 'package:igameapp/src/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/data/remote/remote_data_source.dart';
import 'package:igameapp/src/data/repository.dart';
import 'package:igameapp/src/ui/screens/gamesscreens/gamedetailsscreen/cubit/game_details_cubit.dart';
import 'package:igameapp/src/ui/screens/gamesscreens/homescreen/cubit/home_cubit.dart';
import 'package:igameapp/src/ui/screens/getstartedscreens/splashscreen/cubit/splash_cubit.dart';
import 'package:igameapp/src/ui/screens/settingscreen/settings_controller.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {

  @lazySingleton
  RouteSettingsService get routeSettingsService;

  @lazySingleton
  Repository repository(
          RemoteDataSource remoteDataSource, LocalDataSource localDataSource) =>
      Repository(remoteDataSource, localDataSource);

  @lazySingleton
  AppController appController(Repository repository) =>
      AppController(repository);

  @injectable
  SettingsController settingsController(Repository repository) =>
      SettingsController(repository);

  @injectable
  SplashCubit splashCubit(Repository repository) => SplashCubit(repository);

  @lazySingleton
  HomeCubit homeCubit(Repository repository) => HomeCubit(repository);

  @injectable
  GameDetailsCubit gameDetailsCubit(
          Repository repository, RouteSettingsService routeSettingService) =>
      GameDetailsCubit(repository, routeSettingService.currentRouteSettings?.arguments as GameModel);
}
