import 'dart:async';
import 'dart:collection';

import 'package:logger/logger.dart';

import 'i_log.dart';
import 'log_level.dart';

class Log implements ILog {
  final Logger logger;

  static const int _logCapacity = 12 * 1024;
  static const Duration _logPauseTime = Duration(seconds: 1);
  static final Queue<String> _logBuffer = Queue<String>();
  static final Stopwatch _logStopwatch = Stopwatch();
  static int _printedCharacters = 0;
  static bool _logScheduled = false;

  Log(this.logger);

  @override
  LogLevel? minimalLevel;

  @override
  Future<void> verbose(String message) =>
      _logThrottled(LogLevel.verbose, message);

  @override
  Future<void> debug(String message) => _logThrottled(LogLevel.debug, message);

  @override
  Future<void> info(String message) => _logThrottled(LogLevel.info, message);

  @override
  Future<void> warning(String message) =>
      _logThrottled(LogLevel.warning, message);

  @override
  Future<void> error(String message) => _logThrottled(LogLevel.error, message);

  @override
  Future<void> fatal(String message) => _logThrottled(LogLevel.fatal, message);

  Future<void> _logThrottled(LogLevel logLevel, String message) async {
    if (minimalLevel != null && minimalLevel!.index > logLevel.index) return;

    // New log messages accumulate in the queue
    _logBuffer.add(message);

    // New task can be scheduled inside previous
    if (!_logScheduled) {
      _logTask(logLevel);
    }
  }

  void _logTask(LogLevel logLevel) {
    _logScheduled = false;

    // Reset timer and counter after _logPauseTime seconds
    if (_logStopwatch.elapsed > _logPauseTime) {
      _logStopwatch.stop();
      _logStopwatch.reset();
      _printedCharacters = 0;
    }

    // Keep logging until the limit is exceeded or buffer is empty
    while (_printedCharacters < _logCapacity && _logBuffer.isNotEmpty) {
      final String message;
      if (_logBuffer.isEmpty) {
        _printedCharacters += 'null'.length;
        message = 'null';
      } else {
        message = _logBuffer.removeFirst();
        _printedCharacters += message.length;
      }
      _log(logLevel, message);
    }

    // If the limit is exceeded, schedule a new _logTask in _logPauseTime seconds
    if (_logBuffer.isNotEmpty) {
      _logScheduled = true;
      _printedCharacters = 0;
      Timer(_logPauseTime, () => _logTask(logLevel));
    } else {
      // If the queue is empty, start the timer
      _logStopwatch.start();
    }
  }

  void _log(LogLevel logLevel, String message) {
    switch (logLevel) {
      case LogLevel.verbose:
        logger.v(message);
        break;
      case LogLevel.debug:
        logger.d(message);
        break;
      case LogLevel.info:
        logger.i(message);
        break;
      case LogLevel.warning:
        logger.w(message);
        break;
      case LogLevel.error:
        logger.e(message);
        break;
      case LogLevel.fatal:
        logger.wtf(message);
        break;
      default:
        throw UnsupportedError('$logLevel');
    }
  }
}
