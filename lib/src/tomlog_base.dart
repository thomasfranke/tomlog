import 'dart:developer';

import 'package:tomlog/src/core/log_builder.dart';
import 'package:tomlog/src/models/log_display_type.dart';
import 'package:tomlog/tomlog.dart';

typedef LogHandler = Future<void> Function(TomLogEntry entry);

/// Customizable logger singleton, with support for init and filters.
class TomLog {
  /// Singleton instance
  static final TomLog _instance = TomLog._internal();
  factory TomLog() => _instance;
  TomLog._internal();

  static final bool _initialized = false;

  late bool _printOnlyCritical;

  late bool _printTimeStamp;

  late bool _printLogLevel;

  late bool _printFilename;

  late bool _printClassName;

  late String _timeStampFormat;

  late TomLogPrintType _printType;

  final List<TomLogEntry> history = <TomLogEntry>[];
  final List<LogHandler> _handlers = [];
  static void init({
    bool printOnlyCritical = false,
    bool printTimeStamp = true,
    bool printLogLevel = false,
    bool printFilename = false,
    bool printClassName = true,
    TomLogPrintType printType = TomLogPrintType.slim,
    String timeStampFormat = 'yyyy-MM-dd HH:mm:ss',
    List<LogHandler>? logHandlers,
  }) {
    if (_initialized) {
      throw StateError('TomLog has already been initialized.');
    }

    _instance._printOnlyCritical = printOnlyCritical;
    _instance._printTimeStamp = printTimeStamp;
    _instance._printFilename = printFilename;
    _instance._printFilename = printFilename;
    _instance._printLogLevel = printLogLevel;
    _instance._printClassName = printClassName;
    _instance._timeStampFormat = timeStampFormat;
    _instance._printType = printType;
    if (logHandlers != null) {
      _instance._handlers.addAll(logHandlers);
    }
  }

  /// Logs a debug message.
  void d(final String message, {final TomLogCategory? category}) {
    _logBuilder(message, category: category, logLevel: TomLogLevel.debug);
  }

  /// Logs an info message.
  void i(final String message, {final TomLogCategory? category}) {
    _logBuilder(message, category: category, logLevel: TomLogLevel.info);
  }

  /// Logs a warning message.
  void w(final String message, {final TomLogCategory? category}) {
    _logBuilder(message, category: category, logLevel: TomLogLevel.warning);
  }

  /// Logs an error message.
  void e(final String message, {final TomLogCategory? category}) async {
    TomLogEntry entry = _logBuilder(
      message,
      category: category,
      logLevel: TomLogLevel.error,
    );

    await _notifyHandlers(entry: entry);
  }

  TomLogEntry _logBuilder(
    String message, {
    required TomLogLevel logLevel,
    TomLogCategory? category,
  }) => TomLogBuilder().logBuilder(
    this,
    message,
    printOnlyCritical: _printOnlyCritical,
    printTimeStamp: _printTimeStamp,
    printLogLevel: _printLogLevel,
    printFilename: _printFilename,
    printClassName: _printClassName,
    timeStampFormat: _timeStampFormat,
    printType: _printType,
    category: category,
    logLevel: logLevel,
  );

  String getHistoryString({
    TomLogCategory? filterCategory,
    TomLogLevel? filterLevel,
  }) {
    final buffer = StringBuffer('**TomLog History**\n');

    final filteredEntries = history.where((entry) {
      final matchesCategory =
          filterCategory == null || entry.category == filterCategory.name;
      final matchesLevel =
          filterLevel == null ||
          entry.level.toUpperCase() == filterLevel.name.toUpperCase();
      return matchesCategory && matchesLevel;
    });

    for (final entry in filteredEntries) {
      buffer.writeln(entry.toString());
    }

    return buffer.toString().trim();
  }

  void printHistory({
    TomLogCategory? filterCategory,
    TomLogLevel? filterLevel,
  }) {
    final output = getHistoryString(
      filterCategory: filterCategory,
      filterLevel: filterLevel,
    );

    log(output);
  }

  Future<void> _notifyHandlers({required TomLogEntry entry}) async {
    for (final handler in _handlers) {
      try {
        await handler(entry);
      } catch (e) {
        log('Log handler error: $e');
      }
    }
  }
}
