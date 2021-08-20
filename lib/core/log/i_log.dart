import 'package:logger/logger.dart';

import 'log.dart';
import 'log_level.dart';

typedef LogCallback = Future<void> Function(String message);

final ILog log = ILog.instance;

abstract class ILog {
  static Log? _instance;

  // ignore: prefer_constructors_over_static_methods
  static Log get instance {
    return _instance ??= Log(
      Logger(
        printer: PrettyPrinter(methodCount: 0),
        filter: ProductionFilter(),
      ),
    );
  }

  LogLevel? minimalLevel;

  Future<void> verbose(String message);

  Future<void> debug(String message);

  Future<void> info(String message);

  Future<void> warning(String message);

  Future<void> error(String message);

  Future<void> fatal(String message);
}
