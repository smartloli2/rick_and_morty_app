import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_app/data/db/models/types/app_theme_type.dart';
import 'package:rick_and_morty_app/data/db/models/types/show_mode_type.dart';

part 'app_settings.freezed.dart';

@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({
    required AppThemeType currentThemeType,
    required ShowModeType showModeType,
  }) = _AppSettings;

  const AppSettings._();

  factory AppSettings.byDefault() => const AppSettings(
        currentThemeType: AppThemeType.system,
        showModeType: ShowModeType.list,
      );
}
