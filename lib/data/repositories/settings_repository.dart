import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/data/db/hive_constants.dart';
import 'package:rick_and_morty_app/data/db/i_storage.dart';
import 'package:rick_and_morty_app/data/db/i_storage_factory.dart';
import 'package:rick_and_morty_app/data/db/models/app_settings_model.dart';
import 'package:rick_and_morty_app/domain/contracts/i_settings_repository.dart';
import 'package:rick_and_morty_app/domain/entities/app_settings.dart';
import 'package:rick_and_morty_app/domain/failures/settings_failure.dart';

class SettingsRepository implements ISettingsRepository {
  static const _appSettingsStorageKey = "app_settings";

  final IStorageFactory storageFactory;

  const SettingsRepository({required this.storageFactory});

  @override
  Future<Either<SettingsFailure, AppSettings>> loadSettings() async {
    try {
      final settings = await _getStorage().get(_appSettingsStorageKey);
      if (settings != null) {
        return right(settings.toDomain());
      }
      return left(const SettingsFailure.emptyStorage());
    } on Exception catch (e, stacktrace) {
      return left(
        SettingsFailure.unableToLoad("$e\n $stacktrace"),
      );
    }
  }

  @override
  Future<Either<SettingsFailure, void>> saveSettings(
    AppSettings abstractSettings,
  ) async {
    try {
      return right(
        await _getStorage().put(
          _appSettingsStorageKey,
          AppSettingsModel.fromDomain(abstractSettings),
        ),
      );
    } on Exception catch (e, stacktrace) {
      return left(
        SettingsFailure.unableToUpdate(
          "$e\n $stacktrace",
        ),
      );
    }
  }

  IStorage<AppSettingsModel> _getStorage() =>
      storageFactory.getStorage<AppSettingsModel>(HiveBoxNames.settings);
}
