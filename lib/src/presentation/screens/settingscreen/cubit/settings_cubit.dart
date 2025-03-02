import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igameapp/src/configs/theme/app_theme.dart';
import 'package:igameapp/src/appcubit/app_cubit.dart';
import 'package:igameapp/src/data/repositories/app/app_repo.dart';
import 'package:igameapp/src/di/getit/injection.dart';
import 'package:igameapp/src/presentation/screens/settingscreen/cubit/setting_state.dart';

class SettingsCubit extends Cubit<SettingState> {
  final AppRepo _appRepo;

  SettingsCubit(this._appRepo) : super(SettingState(themes: ThemeModel.themesList)) {
    _initializeThemes();
  }

  void _initializeThemes() {
    List<ThemeModel> updatedThemes = state.themes.map((theme) {
      return theme.copyWith(isSelected: theme.key == _appRepo.themeMode);
    }).toList();
    emit(state.copyWith(themes:updatedThemes));
  }

  void onColorItemClick(ThemeModel clickedTheme) {
    List<ThemeModel> updatedThemes = state.themes.map((theme) {
      return theme.copyWith(isSelected: theme == clickedTheme);
    }).toList();
    emit(state.copyWith(themes:updatedThemes));
    getIt<AppCubit>().changeAppTheme(clickedTheme.key??"dark");
  }

  Future<void> onRefresh() async{

  }
}
