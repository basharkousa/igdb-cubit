import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:igameapp/src/core/configs/theme/app_theme.dart';
part 'setting_state.freezed.dart';
@freezed
class SettingState with _$SettingState {
  const factory SettingState(
      {@Default([])
      List<ThemeModel> themes,
        }) = _SettingState;
}
