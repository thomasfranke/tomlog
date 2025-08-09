import 'dart:developer';

import 'package:tomlog/src/core/log_builder.dart';
import 'package:tomlog/src/models/log_display_type.dart';
import 'package:tomlog/tomlog.dart';

/// Customizable logger singleton, with support for init and filters.
class TomLog {
  /// Singleton instance
  static final TomLog _instance = TomLog._internal();
  factory TomLog() => _instance;
  TomLog._internal();

  static final bool _initialized = false;

  late bool printOnlyCritical;

  late bool printTimeStamp;

  late bool printLogLevel;

  late bool printFilename;

  late bool printClassName;

  late String timeStampFormat;

  late TomLogPrintType printType;

  final List<TomLogEntry> history = <TomLogEntry>[];

  static void init({
    bool printOnlyCritical = false,
    bool printTimeStamp = true,
    bool printLogLevel = false,
    bool printFilename = false,
    bool printClassName = true,
    TomLogPrintType printType = TomLogPrintType.slim,
    String timeStampFormat = 'yyyy-MM-dd HH:mm:ss',
  }) {
    if (_initialized) {
      throw StateError('TomLog has already been initialized.');
    }

    _instance.printOnlyCritical = printOnlyCritical;
    _instance.printTimeStamp = printTimeStamp;
    _instance.printFilename = printFilename;
    _instance.printFilename = printFilename;
    _instance.printLogLevel = printLogLevel;
    _instance.printClassName = printClassName;
    _instance.timeStampFormat = timeStampFormat;
    _instance.printType = printType;
  }

  /// Logs a debug message.
  void d(final String message, {final TomLogCategory? category}) {
    TomLogBuilder().logBuilder(
      _instance,
      message,
      category: category,
      logLevel: TomLogLevel.debug,
    );
  }

  /// Logs an info message.
  void i(final String message, {final TomLogCategory? category}) {
    TomLogBuilder().logBuilder(
      this,
      message,
      category: category,
      logLevel: TomLogLevel.info,
    );
  }

  /// Logs a warning message.
  void w(final String message, {final TomLogCategory? category}) {
    TomLogBuilder().logBuilder(
      this,
      message,
      category: category,
      logLevel: TomLogLevel.warning,
    );
  }

  /// Logs an error message.
  void e(final String message, {final TomLogCategory? category}) {
    TomLogBuilder().logBuilder(
      this,
      message,
      category: category,
      logLevel: TomLogLevel.error,
    );
  }

  void printHistory({
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

    final output = buffer.toString().trim();

    log(output);
  }
}
