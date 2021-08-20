import 'package:mobx/mobx.dart';
import 'package:rick_and_morty_app/core/log/i_log.dart';
import 'package:rick_and_morty_app/domain/contracts/i_settings_repository.dart';
import 'package:rick_and_morty_app/domain/entities/app_settings.dart';
import 'package:rick_and_morty_app/features/search/logic/settings/settings_state.dart';

part 'settings_store.g.dart';

class SettingsStore extends _SettingsStoreBase with _$SettingsStore {
  SettingsStore({required ISettingsRepository settingsRepository})
      : super(settingsRepository);
}

abstract class _SettingsStoreBase with Store {
  final ISettingsRepository settingsRepository;

  _SettingsStoreBase(this.settingsRepository);

  @observable
  SettingsState state = const SettingsState.initial();

  @action
  Future<void> loadSettings() async {
    state = const SettingsState.loading();

    final failOrSettings = await settingsRepository.loadSettings();

    failOrSettings.fold(
      (fail) {
        log.warning("Failed to load settings");
        fail.maybeMap(
          emptyStorage: (_) {
            log.warning("Loaded default settings");
            state = SettingsState.loaded(AppSettings.byDefault());
          },
          orElse: () {
            //.. fail to load (error state)
          },
        );
      },
      (appSettings) {
        state = SettingsState.loaded(appSettings);
      },
    );
  }

  @action
  Future<void> updateSettings(AppSettings appSettings) async {
    final failOrSuccess = await settingsRepository.saveSettings(appSettings);

    failOrSuccess.fold((l) {
      log.warning("Failed to save settings");
    }, (r) {
      state = SettingsState.loaded(appSettings);
    });
  }
}
