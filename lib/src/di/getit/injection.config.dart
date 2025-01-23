// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:igameapp/src/controllers/app_controller.dart' as _i107;
import 'package:igameapp/src/data/local/datasources/floor/app_database.dart'
    as _i898;
import 'package:igameapp/src/data/local/datasources/floor/dao/game_dao.dart'
    as _i864;
import 'package:igameapp/src/data/local/datasources/sharedpref/shared_preference_helper.dart'
    as _i626;
import 'package:igameapp/src/data/local/local_data_source.dart' as _i717;
import 'package:igameapp/src/data/remote/api/app_api.dart' as _i56;
import 'package:igameapp/src/data/remote/api/clients/dio_client.dart' as _i11;
import 'package:igameapp/src/data/remote/api/clients/rest_client.dart' as _i539;
import 'package:igameapp/src/data/remote/api/moduls/auth_api.dart' as _i424;
import 'package:igameapp/src/data/remote/remote_data_source.dart' as _i638;
import 'package:igameapp/src/data/repository.dart' as _i787;
import 'package:igameapp/src/di/getit/modules/app_modules.dart' as _i483;
import 'package:igameapp/src/di/getit/modules/local_modules.dart' as _i818;
import 'package:igameapp/src/di/getit/modules/remote_modules.dart' as _i146;
import 'package:igameapp/src/ui/screens/gamesscreens/gamedetailsscreen/cubit/game_details_cubit.dart'
    as _i591;
import 'package:igameapp/src/ui/screens/gamesscreens/homescreen/cubit/home_cubit.dart'
    as _i275;
import 'package:igameapp/src/ui/screens/getstartedscreens/splashscreen/cubit/splash_cubit.dart'
    as _i981;
import 'package:igameapp/src/ui/screens/settingscreen/settings_controller.dart'
    as _i869;
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
    final remoteModule = _$RemoteModule();
    final localModule = _$LocalModule();
    final appModule = _$AppModule();
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
    gh.lazySingleton<_i56.AppApi>(() => remoteModule.appApi(
          gh<_i11.DioClient>(),
          gh<_i539.RestClient>(),
        ));
    gh.lazySingleton<_i424.AuthApi>(() => remoteModule.authApi(
          gh<_i11.DioClient>(),
          gh<_i539.RestClient>(),
        ));
    gh.lazySingleton<_i717.LocalDataSource>(() => localModule.localDataSource(
          gh<_i626.SharedPreferenceHelper>(),
          gh<_i864.GameDao>(),
        ));
    gh.lazySingleton<_i638.RemoteDataSource>(
        () => remoteModule.remoteDataSource(
              gh<_i56.AppApi>(),
              gh<_i424.AuthApi>(),
            ));
    gh.lazySingleton<_i787.Repository>(() => appModule.repository(
          gh<_i638.RemoteDataSource>(),
          gh<_i717.LocalDataSource>(),
        ));
    gh.factory<_i869.SettingsController>(
        () => appModule.settingsController(gh<_i787.Repository>()));
    gh.factory<_i981.SplashCubit>(
        () => appModule.splashCubit(gh<_i787.Repository>()));
    gh.factory<_i591.GameDetailsCubit>(
        () => appModule.gameDetailsCubit(gh<_i787.Repository>()));
    gh.lazySingleton<_i107.AppController>(
        () => appModule.appController(gh<_i787.Repository>()));
    gh.lazySingleton<_i275.HomeCubit>(
        () => appModule.homeCubit(gh<_i787.Repository>()));
    return this;
  }
}

class _$RemoteModule extends _i146.RemoteModule {}

class _$LocalModule extends _i818.LocalModule {}

class _$AppModule extends _i483.AppModule {}
