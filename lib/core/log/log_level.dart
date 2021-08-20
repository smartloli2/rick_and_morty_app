import 'package:flutter/foundation.dart';

enum LogLevel {
  verbose,
  debug,
  info,
  warning,
  error,
  fatal,
}

extension LogLevelExtension on LogLevel {
  String get name => describeEnum(this);
}
