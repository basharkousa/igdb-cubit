// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:igameapp/src/app/app_cubit.dart' as _i948;
import 'package:igameapp/src/app/app_repo.dart' as _i309;
import 'package:igameapp/src/core/configs/navigation/route_setting.dart'
    as _i764;
import 'package:igameapp/src/core/data/local/datasources/floor/app_database.dart'
    as _i400;
import 'package:igameapp/src/core/data/local/datasources/sharedpref/shared_preference_helper.dart'
    as _i909;
import 'package:igameapp/src/core/data/remote/api/clients/dio_client.dart'
    as _i765;
import 'package:igameapp/src/core/data/remote/api/clients/rest_client.dart'
    as _i536;
import 'package:igameapp/src/core/di/getit/modules/app_modules.dart' as _i838;
import 'package:igameapp/src/core/di/getit/modules/local_modules.dart' as _i934;
import 'package:igameapp/src/core/di/getit/modules/remote_modules.dart'
    as _i360;
import 'package:igameapp/src/features/auth/data/auth_repo.dart' as _i504;
import 'package:igameapp/src/features/auth/di/auth_module.dart' as _i824;
import 'package:igameapp/src/features/auth/presentation/screens/login/cubit/login_cubit.dart'
    as _i729;
import 'package:igameapp/src/features/game/data/game_repo.dart' as _i230;
import 'package:igameapp/src/features/game/data/local/floor/dao/game_dao.dart'
    as _i209;
import 'package:igameapp/src/features/game/data/local/floor/dao/game_favorite_dao.dart'
    as _i821;
import 'package:igameapp/src/features/game/di/game_module.dart' as _i368;
import 'package:igameapp/src/features/game/domain/games_no_connection_usecase.dart'
    as _i11;
import 'package:igameapp/src/features/game/domain/get_games_usecase.dart'
    as _i429;
import 'package:igameapp/src/features/game/domain/get_local_stream_games.dart'
    as _i495;
import 'package:igameapp/src/features/game/domain/remove_local_games_usecase.dart'
    as _i169;
import 'package:igameapp/src/features/game/domain/toggle_favourite_usecase.dart'
    as _i204;
import 'package:igameapp/src/features/game/presentation/screens/gamedetailsscreen/cubit/game_details_cubit.dart'
    as _i50;
import 'package:igameapp/src/features/game/presentation/screens/gamesscreen/cubit/games_cubit.dart'
    as _i219;
import 'package:igameapp/src/features/game/presentation/screens/savedgamesscreen/cubit/saved_games_cubit.dart'
    as _i195;
import 'package:igameapp/src/features/setting/presentation/cubit/settings_cubit.dart'
    as _i551;
import 'package:igameapp/src/features/splash/presentation/cubit/splash_cubit.dart'
    as _i417;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    final remoteModule = _$RemoteModule();
    final localModule = _$LocalModule();
    final authModule = _$AuthModule();
    final gameModule = _$GameModule();
    gh.lazySingleton<_i764.RouteSettingsService>(
        () => appModule.routeSettingsService);
    gh.lazySingleton<_i536.RestClient>(() => remoteModule.restClient);
    gh.lazySingleton<_i361.Dio>(() => remoteModule.dio());
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => localModule.prefs,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i400.AppDatabase>(
      () => localModule.database,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(
      () => authModule.dioAuth(),
      instanceName: 'authDio',
    );
    gh.lazySingleton<_i765.DioClient>(
        () => remoteModule.dioClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i209.GameDao>(
        () => gameModule.gameDao(gh<_i400.AppDatabase>()));
    gh.lazySingleton<_i821.GameFavoriteDao>(
        () => gameModule.gameFavoriteDao(gh<_i400.AppDatabase>()));
    gh.lazySingleton<_i909.SharedPreferenceHelper>(() =>
        localModule.sharedPreferenceHelper(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i765.DioClient>(
      () => authModule.dioClientAuth(gh<_i361.Dio>(instanceName: 'authDio')),
      instanceName: 'authDioClient',
    );
    gh.lazySingleton<_i309.AppRepo>(
        () => appModule.appRepository(gh<_i909.SharedPreferenceHelper>()));
    gh.lazySingleton<_i230.GameRepo>(() => gameModule.gameRepo(
          gh<_i765.DioClient>(),
          gh<_i209.GameDao>(),
          gh<_i821.GameFavoriteDao>(),
        ));
    gh.lazySingleton<_i948.AppCubit>(
        () => appModule.appCubit(gh<_i309.AppRepo>()));
    gh.factory<_i50.GameDetailsCubit>(() => gameModule.gameDetailsCubit(
          gh<_i230.GameRepo>(),
          gh<_i764.RouteSettingsService>(),
        ));
    gh.lazySingleton<_i504.AuthRepo>(() => authModule
        .authRepo(gh<_i765.DioClient>(instanceName: 'authDioClient')));
    gh.lazySingleton<_i729.LoginCubit>(
        () => authModule.gamesCubit(gh<_i504.AuthRepo>()));
    gh.factory<_i417.SplashCubit>(
        () => appModule.splashCubit(gh<_i309.AppRepo>()));
    gh.factory<_i169.RemoveLocalGamesUseCase>(
        () => _i169.RemoveLocalGamesUseCase(gh<_i230.GameRepo>()));
    gh.factory<_i429.GetGamesUseCase>(
        () => _i429.GetGamesUseCase(gh<_i230.GameRepo>()));
    gh.factory<_i204.ToggleFavouriteUseCase>(
        () => _i204.ToggleFavouriteUseCase(gh<_i230.GameRepo>()));
    gh.factory<_i495.GetLocalStreamGamesUseCase>(
        () => _i495.GetLocalStreamGamesUseCase(gh<_i230.GameRepo>()));
    gh.factory<_i551.SettingsCubit>(() => appModule.settingsCubit(
          gh<_i309.AppRepo>(),
          gh<_i169.RemoveLocalGamesUseCase>(),
        ));
    gh.factory<_i11.GamesNoConnectionUseCase>(
        () => _i11.GamesNoConnectionUseCase(
              gh<_i230.GameRepo>(),
              gh<_i169.RemoveLocalGamesUseCase>(),
            ));
    gh.factory<_i195.SavedGamesCubit>(() => gameModule.savedGamesCubit(
          gh<_i495.GetLocalStreamGamesUseCase>(),
          gh<_i204.ToggleFavouriteUseCase>(),
        ));
    gh.lazySingleton<_i219.GamesCubit>(() => gameModule.gamesCubit(
          gh<_i11.GamesNoConnectionUseCase>(),
          gh<_i429.GetGamesUseCase>(),
          gh<_i204.ToggleFavouriteUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i838.AppModule {
  @override
  _i764.RouteSettingsService get routeSettingsService =>
      _i764.RouteSettingsService();
}

class _$RemoteModule extends _i360.RemoteModule {}

class _$LocalModule extends _i934.LocalModule {}

class _$AuthModule extends _i824.AuthModule {}

class _$GameModule extends _i368.GameModule {}
