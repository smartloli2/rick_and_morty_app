import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/core/log/i_log.dart';
import 'package:rick_and_morty_app/core/log/log_level.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  /// Logging
  log.minimalLevel = LogLevel.verbose;

  _registerApies();

  _registerStorages();

  _registerRepositories();

  _registerStores();
}

void _registerStores() {}

void _registerRepositories() {}

void _registerApies() {}

void _registerStorages() {}
