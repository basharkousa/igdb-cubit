// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:igameapp/src/appcubit/app_cubit.dart' as _i872;
import 'package:igameapp/src/core/configs/navigation/route_setting.dart'
    as _i764;
import 'package:igameapp/src/core/data/local/datasources/floor/app_database.dart'
    as _i400;
import 'package:igameapp/src/core/data/local/datasources/floor/dao/game_dao.dart'
    as _i159;
import 'package:igameapp/src/core/data/local/datasources/sharedpref/shared_preference_helper.dart'
    as _i909;
import 'package:igameapp/src/core/data/remote/api/clients/dio_client.dart'
    as _i765;
import 'package:igameapp/src/core/data/remote/api/clients/rest_client.dart'
    as _i536;
import 'package:igameapp/src/core/data/repositories/app/app_repo.dart' as _i365;
import 'package:igameapp/src/core/data/repositories/game/game_repo.dart'
    as _i518;
import 'package:igameapp/src/core/di/getit/modules/app_modules.dart' as _i838;
import 'package:igameapp/src/core/di/getit/modules/local_modules.dart' as _i934;
import 'package:igameapp/src/core/di/getit/modules/remote_modules.dart'
    as _i360;
import 'package:igameapp/src/core/domain/games_no_connection_usecase.dart'
    as _i171;
import 'package:igameapp/src/core/domain/remove_local_games_usecase.dart'
    as _i78;
import 'package:igameapp/src/core/domain/repositories/i_game_repo.dart'
    as _i666;
import 'package:igameapp/src/core/presentation/screens/gamesscreens/gamedetailsscreen/cubit/game_details_cubit.dart'
    as _i464;
import 'package:igameapp/src/core/presentation/screens/gamesscreens/homescreen/cubit/home_cubit.dart'
    as _i305;
import 'package:igameapp/src/core/presentation/screens/getstartedscreens/splashscreen/cubit/splash_cubit.dart'
    as _i337;
import 'package:igameapp/src/core/presentation/screens/settingscreen/cubit/settings_cubit.dart'
    as _i75;
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
    gh.lazySingleton<_i765.DioClient>(
        () => remoteModule.dioClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i159.GameDao>(
        () => localModule.gameDao(gh<_i400.AppDatabase>()));
    gh.lazySingleton<_i909.SharedPreferenceHelper>(() =>
        localModule.sharedPreferenceHelper(gh<_i460.SharedPreferences>()));
    gh.factory<_i78.RemoveLocalGamesUseCase>(
        () => _i78.RemoveLocalGamesUseCase(gh<_i518.GameRepo>()));
    gh.factory<_i171.GamesNoConnectionUseCase>(
        () => _i171.GamesNoConnectionUseCase(
              gh<_i518.GameRepo>(),
              gh<_i78.RemoveLocalGamesUseCase>(),
            ));
    gh.factory<_i464.GameDetailsCubit>(() => appModule.gameDetailsCubit(
          gh<_i518.GameRepo>(),
          gh<_i764.RouteSettingsService>(),
        ));
    gh.lazySingleton<_i666.IGameRepo>(() => appModule.gameRepo(
          gh<_i765.DioClient>(),
          gh<_i159.GameDao>(),
        ));
    gh.lazySingleton<_i365.AppRepo>(
        () => appModule.appRepository(gh<_i909.SharedPreferenceHelper>()));
    gh.lazySingleton<_i305.HomeCubit>(() => appModule.homeCubit(
          gh<_i518.GameRepo>(),
          gh<_i171.GamesNoConnectionUseCase>(),
        ));
    gh.factory<_i337.SplashCubit>(
        () => appModule.splashCubit(gh<_i365.AppRepo>()));
    gh.lazySingleton<_i872.AppCubit>(
        () => appModule.appCubit(gh<_i365.AppRepo>()));
    gh.factory<_i75.SettingsCubit>(() => appModule.settingsCubit(
          gh<_i365.AppRepo>(),
          gh<_i78.RemoveLocalGamesUseCase>(),
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
