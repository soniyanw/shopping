import 'package:logger/logger.dart';

abstract class AppLogger {
  final Logger _log = Logger();

  void d(dynamic message) => _log.d(message);

  void i(dynamic message) => _log.i(message);

  void e(dynamic message) => _log.e(message);
}

class _AppLogger extends AppLogger {
  static final _AppLogger _logger = _AppLogger();
}

extension LoggerUtils on Object {
  AppLogger get log => _AppLogger._logger;
}
