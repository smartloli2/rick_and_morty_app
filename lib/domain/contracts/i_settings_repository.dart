import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/domain/entities/app_settings.dart';
import 'package:rick_and_morty_app/domain/failures/settings_failure.dart';

abstract class ISettingsRepository {
  Future<Either<SettingsFailure, AppSettings>> loadSettings();

  Future<Either<SettingsFailure, void>> saveSettings(
    AppSettings settings,
  );
}
