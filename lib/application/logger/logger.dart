import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart' as log;

import 'i_logger.dart';

@LazySingleton(as: ILogger)
class Logger implements ILogger {
  final _logger = log.Logger();

  @override
  void debug(dynamic message, [error, StackTrace? stackTrace]) =>
      _logger.d(message, error: error, stackTrace: stackTrace);

  @override
  void error(dynamic message, [error, StackTrace? stackTrace]) =>
      _logger.e(message, error: error, stackTrace: stackTrace);

  @override
  void info(dynamic message, [error, StackTrace? stackTrace]) =>
      _logger.i(message, error: error, stackTrace: stackTrace);

  @override
  void warning(dynamic message, [error, StackTrace? stackTrace]) =>
      _logger.w(message, error: error, stackTrace: stackTrace);

  @override
  void infoServer(instance) {
    _logger.i('Start the ${instance.runtimeType} instance');
  }
}
