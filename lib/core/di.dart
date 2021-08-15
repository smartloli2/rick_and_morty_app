import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/core/log/i_log.dart';
import 'package:rick_and_morty_app/core/log/log_level.dart';
import 'package:rick_and_morty_app/data/api/rick_and_morty_api.dart';
import 'package:rick_and_morty_app/data/repositories/rick_and_morty_repository.dart';
import 'package:rick_and_morty_app/features/search/logic/search_store.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  /// Logging
  log.minimalLevel = LogLevel.verbose;

  getIt.registerLazySingleton<Dio>(() => Dio());

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

void _registerStorages() {}

void _registerRepositories() {
  getIt.registerLazySingleton<RickAndMortyRepository>(
    () => RickAndMortyRepository(
      getIt<RickAndMortyApi>(),
    ),
  );
}

void _registerStores() {
  getIt.registerFactory<SearchStore>(
    () => SearchStore(getIt<RickAndMortyRepository>()),
  );
}
