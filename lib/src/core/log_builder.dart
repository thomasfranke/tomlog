import 'dart:developer' as developer;

import 'package:tomlog/src/helpers/caller_class.dart';
import 'package:tomlog/src/models.dart/log_category.dart';
import 'package:tomlog/tomlog.dart';

class TomLogBuilder {
  /// Loga uma mensagem com nível e rastreia o chamador
  void logBuilder(
    TomLog logger,
    String message, {
    required bool printOnlyCritical,
    required TomLogLevel logLevel,
    TomLogCategory? category,
  }) {
    if (printOnlyCritical && logLevel != TomLogLevel.error) return;

    final now = DateTime.now().toIso8601String();
    final prefix = logLevel.name.toUpperCase();
    final file = getCallerFilename();
    final className = getCallerClass();

    final logLine = '[$now][$prefix][$file][$className] $message';
    developer.log(logLine);
  }
}
