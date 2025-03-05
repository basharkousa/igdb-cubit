import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igameapp/src/core/configs/theme/app_theme.dart';
import 'package:igameapp/src/appcubit/app_cubit.dart';
import 'package:igameapp/src/core/data/repositories/app/app_repo.dart';
import 'package:igameapp/src/core/di/getit/injection.dart';
import 'package:igameapp/src/core/domain/remove_local_games_usecase.dart';
import 'package:igameapp/src/core/presentation/screens/settingscreen/cubit/setting_state.dart';

class SettingsCubit extends Cubit<SettingState> {
  final AppRepo _appRepo;
  final RemoveLocalGamesUseCase _removeLocalGamesUseCase;
  SettingsCubit(this._appRepo,this._removeLocalGamesUseCase)
      : super(SettingState(themes: ThemeModel.themesList)) {
    _initializeThemes();
  }

  void _initializeThemes() {
    List<ThemeModel> updatedThemes = state.themes.map((theme) {
      return theme.copyWith(isSelected: theme.key == _appRepo.themeMode);
    }).toList();
    emit(state.copyWith(themes: updatedThemes));
  }

  void onColorItemClick(ThemeModel clickedTheme) {
    List<ThemeModel> updatedThemes = state.themes.map((theme) {
      return theme.copyWith(isSelected: theme == clickedTheme);
    }).toList();
    emit(state.copyWith(themes: updatedThemes));
    getIt<AppCubit>().changeAppTheme(clickedTheme.key ?? "dark");
  }

  void removeGames() => _removeLocalGamesUseCase();

  Future<void> onRefresh() async {}
}
