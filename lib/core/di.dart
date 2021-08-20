import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/core/log/i_log.dart';
import 'package:rick_and_morty_app/core/log/log_level.dart';
import 'package:rick_and_morty_app/data/api/rick_and_morty_api.dart';
import 'package:rick_and_morty_app/data/db/hive_storage_factory.dart';
import 'package:rick_and_morty_app/data/db/i_storage_factory.dart';
import 'package:rick_and_morty_app/data/repositories/character_repository.dart';
import 'package:rick_and_morty_app/data/repositories/search_request_repository.dart';
import 'package:rick_and_morty_app/data/repositories/settings_repository.dart';
import 'package:rick_and_morty_app/features/home/logic/recently_viewed_characters_store.dart';
import 'package:rick_and_morty_app/features/search/logic/search_store.dart';
import 'package:rick_and_morty_app/features/search/logic/settings/settings_store.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  /// Logging
  log.minimalLevel = LogLevel.verbose;

  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerSingleton<DefaultCacheManager>(DefaultCacheManager());

  _registerApies();

  _registerStorages();

  _registerRepositories();

  _registerStores();
}

void _registerApies() {
  getIt.registerLazySingleton<RickAndMortyApi>(
    () => RickAndMortyApi(
      dio: getIt<Dio>(),
    ),
  );
}

void _registerStorages() {
  getIt.registerFactory<IStorageFactory>(() => HiveStorageFactory());
}

void _registerRepositories() {
  getIt.registerLazySingleton<CharacterRepository>(
    () => CharacterRepository(
      rickAndMortyApi: getIt<RickAndMortyApi>(),
      cacheManager: getIt<DefaultCacheManager>(),
      storageFactory: getIt<IStorageFactory>(),
    ),
  );
  getIt.registerLazySingleton<SearchRequestRepository>(
    () => SearchRequestRepository(
      storageFactory: getIt<IStorageFactory>(),
    ),
  );

  getIt.registerLazySingleton<SettingsRepository>(() => SettingsRepository(
        storageFactory: getIt<IStorageFactory>(),
      ));
}

void _registerStores() {
  getIt.registerFactory<SearchStore>(
    () => SearchStore(
      characterRepository: getIt<CharacterRepository>(),
      searchRequestRepository: getIt<SearchRequestRepository>(),
      settingsRepository: getIt<SettingsRepository>(),
    ),
  );
  getIt.registerFactory<RecentlyViewedCharactersStore>(
    () => RecentlyViewedCharactersStore(
      characterRepository: getIt<CharacterRepository>(),
    ),
  );

  getIt.registerFactory<SettingsStore>(
    () => SettingsStore(
      settingsRepository: getIt<SettingsRepository>(),
    ),
  );
}
