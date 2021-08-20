import 'package:hive/hive.dart';
import 'package:rick_and_morty_app/data/db/models/types/app_theme_type.dart';
import 'package:rick_and_morty_app/data/db/models/types/show_mode_type.dart';
import 'package:rick_and_morty_app/domain/entities/app_settings.dart';

import '../hive_constants.dart';

part 'app_settings_model.g.dart';

@HiveType(typeId: HiveTypeIds.appSettings)
class AppSettingsModel {
  @HiveField(0)
  final AppThemeType currentThemeType;
  @HiveField(1)
  final ShowModeType showModeType;

  const AppSettingsModel({
    required this.currentThemeType,
    required this.showModeType,
  });

  factory AppSettingsModel.fromDomain(AppSettings appSettings) {
    return AppSettingsModel(
      currentThemeType: appSettings.currentThemeType,
      showModeType: appSettings.showModeType,
    );
  }

  AppSettings toDomain() {
    return AppSettings(
      currentThemeType: currentThemeType,
      showModeType: showModeType,
    );
  }
}
