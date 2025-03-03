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
import 'package:igameapp/src/configs/navigation/route_setting.dart' as _i991;
import 'package:igameapp/src/data/local/datasources/floor/app_database.dart'
    as _i898;
import 'package:igameapp/src/data/local/datasources/floor/dao/game_dao.dart'
    as _i864;
import 'package:igameapp/src/data/local/datasources/sharedpref/shared_preference_helper.dart'
    as _i626;
import 'package:igameapp/src/data/remote/api/clients/dio_client.dart' as _i11;
import 'package:igameapp/src/data/remote/api/clients/rest_client.dart' as _i539;
import 'package:igameapp/src/data/repositories/app/app_repo.dart' as _i3;
import 'package:igameapp/src/data/repositories/game/game_repo.dart' as _i358;
import 'package:igameapp/src/di/getit/modules/app_modules.dart' as _i483;
import 'package:igameapp/src/di/getit/modules/local_modules.dart' as _i818;
import 'package:igameapp/src/di/getit/modules/remote_modules.dart' as _i146;
import 'package:igameapp/src/domain/games_no_connection_usecase.dart' as _i54;
import 'package:igameapp/src/domain/remove_local_games_usecase.dart' as _i1012;
import 'package:igameapp/src/presentation/screens/gamesscreens/gamedetailsscreen/cubit/game_details_cubit.dart'
    as _i1048;
import 'package:igameapp/src/presentation/screens/gamesscreens/homescreen/cubit/home_cubit.dart'
    as _i957;
import 'package:igameapp/src/presentation/screens/getstartedscreens/splashscreen/cubit/splash_cubit.dart'
    as _i1013;
import 'package:igameapp/src/presentation/screens/settingscreen/cubit/settings_cubit.dart'
    as _i502;
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
    gh.lazySingleton<_i991.RouteSettingsService>(
        () => appModule.routeSettingsService);
    gh.lazySingleton<_i539.RestClient>(() => remoteModule.restClient);
    gh.lazySingleton<_i361.Dio>(() => remoteModule.dio());
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => localModule.prefs,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i898.AppDatabase>(
      () => localModule.database,
      preResolve: true,
    );
    gh.lazySingleton<_i864.GameDao>(
        () => localModule.gameDao(gh<_i898.AppDatabase>()));
    gh.lazySingleton<_i11.DioClient>(
        () => remoteModule.dioClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i626.SharedPreferenceHelper>(() =>
        localModule.sharedPreferenceHelper(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i3.AppRepo>(
        () => appModule.appRepository(gh<_i626.SharedPreferenceHelper>()));
    gh.lazySingleton<_i358.GameRepo>(() => appModule.gameRepo(
          gh<_i11.DioClient>(),
          gh<_i864.GameDao>(),
        ));
    gh.factory<_i1013.SplashCubit>(
        () => appModule.splashCubit(gh<_i3.AppRepo>()));
    gh.lazySingleton<_i872.AppCubit>(
        () => appModule.appCubit(gh<_i3.AppRepo>()));
    gh.factory<_i1048.GameDetailsCubit>(() => appModule.gameDetailsCubit(
          gh<_i358.GameRepo>(),
          gh<_i991.RouteSettingsService>(),
        ));
    gh.factory<_i1012.RemoveLocalGamesUseCase>(
        () => _i1012.RemoveLocalGamesUseCase(gh<_i358.GameRepo>()));
    gh.factory<_i502.SettingsCubit>(() => appModule.settingsCubit(
          gh<_i3.AppRepo>(),
          gh<_i1012.RemoveLocalGamesUseCase>(),
        ));
    gh.factory<_i54.GamesNoConnectionUseCase>(
        () => _i54.GamesNoConnectionUseCase(
              gh<_i358.GameRepo>(),
              gh<_i1012.RemoveLocalGamesUseCase>(),
            ));
    gh.lazySingleton<_i957.HomeCubit>(() => appModule.homeCubit(
          gh<_i358.GameRepo>(),
          gh<_i54.GamesNoConnectionUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i483.AppModule {
  @override
  _i991.RouteSettingsService get routeSettingsService =>
      _i991.RouteSettingsService();
}

class _$RemoteModule extends _i146.RemoteModule {}

class _$LocalModule extends _i818.LocalModule {}
