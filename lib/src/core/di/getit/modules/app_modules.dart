import 'package:igameapp/src/core/configs/navigation/route_setting.dart';
import 'package:igameapp/src/app/app_cubit.dart';
import 'package:igameapp/src/core/data/local/datasources/sharedpref/shared_preference_helper.dart';
import 'package:igameapp/src/app/app_repo.dart';
import 'package:igameapp/src/features/setting/presentation/cubit/settings_cubit.dart';
import 'package:igameapp/src/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:igameapp/src/features/game/domain/remove_local_games_usecase.dart';
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


  @injectable
  SettingsCubit settingsCubit(
          AppRepo repository, RemoveLocalGamesUseCase useCase) =>
      SettingsCubit(repository, useCase);
}
