import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_app/domain/entities/app_settings.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;

  const factory SettingsState.loading() = _Loading;

  const factory SettingsState.loaded(AppSettings appSettings) = _Loaded;
}
