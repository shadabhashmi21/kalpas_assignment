import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LogHelper {
  static final bool _isLogEnabled = kDebugMode;

  static final _logger = Logger(
    printer: PrettyPrinter(),
  );

  static logErrorString(String string) {
    if (_isLogEnabled) _logger.e(string);
  }

  static logDebugging(String string) {
    if (_isLogEnabled) _logger.d(string);
  }

  static logInfo(String string) {
    if (_isLogEnabled) _logger.i(string);
  }
}
